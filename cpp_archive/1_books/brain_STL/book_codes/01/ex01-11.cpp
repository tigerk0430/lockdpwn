#include <iostream>
using namespace std;

class Point
{
    int x;
    int y;
public:
    Point(int _x =0 , int _y =0 ):x(_x),y(_y) { }
    void Print( ) const { cout << x <<',' << y << endl; }
    bool operator== (const Point& arg) const
    {
      return x==arg.x && y==arg.y ? true : false;
    }
    bool operator!= (const Point& arg) const
    {
      return !(*this == arg);
    }
};
void main( )
{
    Point p1(2,3), p2(5,5), p3(2,3);
    
    if( p1 != p2 )  // p1.operator!= (p2) �� �����ϴ�.
      cout << "p1 != p2" << endl;
    if( p1 != p3 )  // p1.operator!= (p3) �� �����ϴ�.
      cout << "p1 != p3" << endl;
}