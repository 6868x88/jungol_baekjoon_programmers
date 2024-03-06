/*
내적
*/


import java.util.*;

class Solution {
    public int solution(int[] a, int[] b) {
        int answer = 0;
        int[] mul = new int[a.length];
        
        for(int i=0; i<a.length; i++){
            mul[i] = a[i] * b[i];
            answer += mul[i];
        }
        
        return answer;
    }
}
