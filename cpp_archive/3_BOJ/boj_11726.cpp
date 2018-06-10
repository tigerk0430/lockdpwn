/*
 * +description:
 *  백준 11726, 2xn 타일링 문제를 푼 정답 코드
 *              DP를 사용해서 문제를 풀었다
 *
 *  code from [boj 알고리즘기초 다이나믹프로그래밍1 문제풀이1]
 *
 * +author: Edward Im (gyurse@gmail.com)
 */
#include <iostream>
using namespace std;
int d[1001];
int main() {
  d[0]=1;
  d[1]=1;

  int n;
  cin >> n;

  // d[i] = d[i-1] + d[i-2]
  for(int i=2; i<=n; i++) {
    d[i] = d[i-1] + d[i-2];
    d[i] %= 10007;
  }
  cout << d[n] << endl;

  return 0;
}
