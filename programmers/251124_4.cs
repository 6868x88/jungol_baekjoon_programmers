using System;
public class Solution {
    public long solution(long n) {

            long n = 121;
            long answer = 0;

            var num = Math.Sqrt(n);
            if (Math.Floor(num) == num)
            {
                num += 1;
                answer = (long)Math.Pow(num, 2);
            }
            else {
                answer = -1;
        return answer;
    }
}
