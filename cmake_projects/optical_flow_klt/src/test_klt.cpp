#include <stdio.h>
#include <queue>
#include <map>
#include <vector>
#include <thread>
#include <mutex>
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>

#include <sensor_msgs/Image.h>
#include <eigen3/Eigen/Dense>
#include <opencv2/opencv.hpp>
#include <opencv2/core/eigen.hpp>

#include "klt_tracker.h"

using namespace std;
queue<sensor_msgs::ImageConstPtr> img0_buf;
std::mutex m_buf;
int inputImageCnt;
Tracker *pTraker;

void img0_callback(const sensor_msgs::ImageConstPtr &img_msg)
{
    m_buf.lock();
    img0_buf.push(img_msg);
    m_buf.unlock();
}

void inputImage(double time0, const cv::Mat &image0)
{
    inputImageCnt++;
    printf("[%.9f] i'm in inputImage : %d th call \n", time0, inputImageCnt);
    pTraker->trackImage(time0, image0);
    
    cv::Mat imTrack = pTraker->getTrackImage();
    cv::imshow("KLT Demo", imTrack);
    cv::waitKey(10);
}


cv::Mat getImageFromMsg(const sensor_msgs::ImageConstPtr &img_msg)
{
    cv_bridge::CvImageConstPtr ptr;
    if (img_msg->encoding == "8UC1")
    {
        sensor_msgs::Image img;
        img.header = img_msg->header;
        img.height = img_msg->height;
        img.width = img_msg->width;
        img.is_bigendian = img_msg->is_bigendian;
        img.step = img_msg->step;
        img.data = img_msg->data;
        img.encoding = "mono8";
        ptr = cv_bridge::toCvCopy(img, sensor_msgs::image_encodings::MONO8);
    }
    else
        ptr = cv_bridge::toCvCopy(img_msg, sensor_msgs::image_encodings::MONO8);

    cv::Mat img = ptr->image.clone();
    return img;
}

void process()
{
    sensor_msgs::ImageConstPtr image_msg = NULL;

    while(1)
    {
        cv::Mat image0;
        std_msgs::Header header;
        double time0=0;

        m_buf.lock();
        if (!img0_buf.empty())
        {
            time0 = img0_buf.front()->header.stamp.toSec();
            // 0.003s sync tolerance

            header = img0_buf.front()->header;
            image0 = getImageFromMsg(img0_buf.front());
            img0_buf.pop();
            // printf("find img0 and img1 buf size = %d, %d\n", img0_buf.size(), img1_buf.size() );
        }
        m_buf.unlock();

        if(!image0.empty())
            inputImage(time0, image0);

        chrono::milliseconds dura(1);
        std::this_thread::sleep_for(dura);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "test_klt");
    ros::NodeHandle n("~");

    ROS_INFO("init node");

    // initialize parameters
    inputImageCnt = 0;
    pTraker = new Tracker();

    // subscribe topics
    std::string IMAGE0_TOPIC = "/camera/image_color";
    ros::Subscriber sub_img0 = n.subscribe(IMAGE0_TOPIC, 200, img0_callback);

    ROS_INFO("[+] optical_folow_test thread has started...");

    // start image processing thread
    std::thread measurement_process;
    measurement_process = std::thread(process);

    ros::spin();

    return 0;
}
