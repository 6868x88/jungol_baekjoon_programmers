/*
기사단원의 무기
*/

import java.util.*;
class Solution {
    public int solution(int number, int limit, int power) {
        int answer = 0;
        
        int[] arr = new int[number];
        
        for(int j=1; j<=number; j++){
            int count = 0; //약수의 갯수
            
            for(int i=1; i*i<=j; i++){
                if(i*i == j) count++;
                else if (j%i == 0) count += 2;
            }
            
            arr[j-1] = count;
            
            if(arr[j-1] > limit) arr[j-1] = power;
            answer += arr[j-1];
        }
        
        return answer;
    }
}
