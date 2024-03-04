/*
카펫
*/

import java.util.*;

class Solution {
    public int[] solution(int brown, int yellow) {
        int[] answer = {};
        answer = new int [2];
        
        List<Integer> test = new ArrayList<Integer>();
        
        int num1 = brown + yellow; //넓이
        int num2 = (yellow -num1 -4)/(-2); //가로+세로
      
        for(int i=3; i<num2; i++){
            if(num1 % i == 0 & i * (num2 - i) == num1){
                test.add(i);
            }
        }
        
        if(test.size() == 1){
            test.add(test.get(0));
        }
        
        Collections.reverse(test);
        
        for(int i=0; i<answer.length; i++){
            answer[i] = test.get(i);
        }
        
        return answer;
    }
}
