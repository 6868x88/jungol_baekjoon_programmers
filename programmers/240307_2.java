/*
콜라 문제
*/

import java.util.*;

class Solution {
    public int solution(int a, int b, int n) {
        int answer = 0;
        int num = 0;
        int num2 = a/b;
        
        while(n >= a){
            num = b*(n/a);
            n = (n%a) + num;
            answer += num;
        }
        
        return answer;
    }
}
