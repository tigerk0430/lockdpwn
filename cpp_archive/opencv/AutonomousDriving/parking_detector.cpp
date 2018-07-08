#include <iostream>//c++ files
#include <opencv2\opencv.hpp>//opencv library function #include <opencv2\imgproc\imgproc.hpp>//image processing

using namespace cv;
using namespace std;

/*�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�*/
//#define filename           "AVM.mp4"
#define filename             "AVM.png"
//#define filename           "rose.jpg"
#define SaveFileName         "result.png"
#define video 0 #define image 1
/*�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�*/

/// Trackbar strings
char* window_name = "AVM";
int main() {
	// Initialize Matrix
	Mat src, BGR, HSV, gray, dst, LAB, test;
	src = imread(filename, 1);
	BGR = src.clone();
	cvtColor(src, HSV, CV_BGR2HSV);
	cvtColor(src, gray, CV_BGR2GRAY);
	cvtColor(src, LAB, CV_BGR2Lab);
	/// Create a window to display results

	namedWindow(window_name, 0);
	resizeWindow(window_name, 1000, 700);

	// BGR, HSV
	Mat B(BGR.rows, BGR.cols, CV_8UC1);
	Mat G(BGR.rows, BGR.cols, CV_8UC1);
	Mat R(BGR.rows, BGR.cols, CV_8UC1);
	Mat outBGR[] = { B, G, R };
	int from_toBGR[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&BGR, 1, outBGR, 3, from_toBGR, 3);

	Mat H(HSV.rows, HSV.cols, CV_8UC1);
	Mat S(HSV.rows, HSV.cols, CV_8UC1);
	Mat V(HSV.rows, HSV.cols, CV_8UC1);
	Mat outHSV[] = { H, S, V };
	int from_toHSV[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&HSV, 1, outHSV, 3, from_toHSV, 3);

	Mat L(LAB.rows, LAB.cols, CV_8UC1);
	Mat a(LAB.rows, LAB.cols, CV_8UC1);
	Mat b(LAB.rows, LAB.cols, CV_8UC1);
	Mat outLAB[] = { L, a, b };
	int from_toLAB[] = { 0,0, 1,1, 2,2 }; 
	mixChannels(&LAB, 1, outLAB, 3, from_toLAB, 3);

	// Harris corner variables
	int thresh = 150;
	int blockSize = 6; //5
	int apertureSize = 5; //5 
	double k = 0.06;
	for (;;) {
		// save, quit operate
		int input_key = waitKey(30);
		imshow(window_name, src);
		adaptiveThreshold(gray, test, 250, CV_ADAPTIVE_THRESH_MEAN_C, CV_THRESH_BINARY, 3, 5);

		/* ----------------- hough line transform ------------------- */
		Mat dst, cdst;
		Canny(src, dst, 200, 250, 3);
		cvtColor(dst, cdst, CV_GRAY2BGR);

		morphologyEx(cdst, cdst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));
		//morphologyEx(cdst, cdst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));
		//morphologyEx(cdst, cdst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));

		vector<Vec4i> lines;
		HoughLinesP(dst, lines, 1, CV_PI / 180, 50, 50, 10);
		for (size_t i = 0; i < lines.size(); i++) {
			Vec4i l = lines[i];
			line(cdst, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0, 0, 255), 3, CV_AA);
		}
		/* ---------------------------------------------------------- */
		/* -------------- Detecting corners -------------------- */
		Mat dst_norm2, dst_norm_scaled2, dst2;
		//int thresh = 150;
		//int blockSize = 5;
		//int apertureSize = 5;
		//double k = 0.06;
		cornerHarris(gray, dst2, blockSize, apertureSize, k, BORDER_DEFAULT); normalize(dst2, dst_norm2, 0, 255, NORM_MINMAX, CV_32FC1, Mat()); convertScaleAbs(dst_norm2, dst_norm_scaled2); 
		/// Drawing a circle around corners
		for (int j = 0; j < dst_norm2.rows; j++) {
			for (int i = 0; i < dst_norm2.cols; i++) {
				if ((int)dst_norm2.at<float>(j, i) > thresh) {
					circle(gray, Point(i, j), 5, Scalar(255, 0, 0), 1, 8, 0);
				}
			}
		}
		/* ---------------------------------------------------------- */
		/* ----------------------Contour region making --------------- */
		Mat img_temp = gray.clone();
		Mat img_contour, check, img2;
		vector<vector<Point>> contours;

		img2 = 255 - img_temp;
		img_contour = img2.clone();
		Mat hierarchy;
		findContours(img_contour, contours, hierarchy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));
		vector<vector<Point>> contours_poly(contours.size());
		vector<Rect> bound(contours.size());

		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));
		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));
		morphologyEx(img_contour,img_contour, CV_MOP_OPEN, getStructuringElement(MORPH_RECT, Size(15, 15)));

		Mat contour_dst;
		Canny(img_contour, contour_dst, 200, 50, 3);
		Canny(contour_dst, contour_dst, 200, 50, 3);

		morphologyEx(contour_dst, contour_dst, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15, 15)));

		int contour_num = 0;
		check = img_temp.clone();
		vector<Rect> bound2(contours.size());

		for (int i = 0; i < contours.size(); i++) {
			approxPolyDP(Mat(contours[i]), contours_poly[i], 1, true); // approximate of contour      
			bound[i] = boundingRect(Mat(contours_poly[i]));      // Make rectangular boundary      
		}
		
		// Contour limitation for detecting license
		Mat drawing = gray.clone();
		Mat drawing2 = gray.clone();
		cvtColor(drawing, drawing, CV_GRAY2BGR);

		//int refinery_count = 0;
		//for (int i = 0; i < contours.size(); i++) {
		//	double ratio = abs((double)bound[i].height / bound[i].width);
		//	Point contour_WH = (bound[i].tl() - bound[i].br());
		//	drawContours(drawing, contours, i, Scalar(0, 0, 255), 2, 8, hierarchy, 0, Point());
		//}

		adaptiveThreshold(check, check, 255, CV_ADAPTIVE_THRESH_MEAN_C, CV_THRESH_BINARY_INV, 3, 5);

		/* ---------------------------------------------------------- */
		//// morphology operation
		//morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_DILATE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_ERODE, getStructuringElement(MORPH_RECT, Size(10, 10)));
		//morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));
		//morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));
		morphologyEx(check, check, CV_MOP_CLOSE, getStructuringElement(MORPH_RECT, Size(15,15)));


		/* -------------- Detecting corners -------------------- */
		Mat dst_norm3, dst_norm_scaled3, dst3;

		thresh = 160;
		blockSize = 3;
		apertureSize = 3;
		k = 0.06;

		cornerHarris(check, dst3, blockSize, apertureSize, k, BORDER_DEFAULT);
		//cornerHarris(contour_dst, dst3, blockSize, apertureSize, k, BORDER_DEFAULT);
		normalize(dst3, dst_norm3, 0, 255, NORM_MINMAX, CV_32FC1, Mat());
		convertScaleAbs(dst_norm3, dst_norm_scaled3);

		///// Drawing a circle around corners
		//for (int j = 0; j < dst_norm3.rows; j++) {
		//	for (int i = 0; i < dst_norm3.cols; i++) {
		//		if ((int)dst_norm3.at<float>(j, i) > thresh) {
		//			circle(drawing, Point(i, j), 5, Scalar(0,0,255), 2, 8, 0);
		//		}
		//	}
		//}

		HoughLinesP(contour_dst, lines, 1, CV_PI/180, 100, 50, 50);
		for (size_t i = 0; i < lines.size(); i++) {
			Vec4i l = lines[i];
			line(drawing, Point(l[0], l[1]), Point(l[2], l[3]), Scalar(0,255,0), 2, CV_AA);
		}

		/* ---------------------------------------------------------- */
		if (input_key == 'q' || input_key == 'Q') {
			cout << "Program Termination" << endl;
			break;
		}
		else if (input_key == 'c' || input_key == 'C') imwrite(SaveFileName, dst);
		//else if (input_key == 's' || input_key == 'S') cout << "T_val =  " << T_val << endl;
		input_key = 0;
	}

	return 0;
}