/*
최댓값과 최솟값
*/

import java.util.*;

class Solution {
    public String solution(String s) {
        String[] str = s.split(" ");
        int[] arr = Arrays.stream(str)
                          .mapToInt(Integer :: parseInt)
                          .toArray();
        
        int max = arr[0], min = arr[0];
        
        for(int i=0; i<arr.length; i++){
            if(arr[i] > max){
                max = arr[i];
            }
            
            if(arr[i] < min){
                min = arr[i];
            }
        }
        String answer = min + " " + max;
        
        return answer;
    }
}
