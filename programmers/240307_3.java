/*
크기가 작은 부분 문자열
*/


import java.util.*;

class Solution {
    public int solution(String t, String p) {
        int answer = 0;
        
        for(int i=0; i<t.length()-p.length()+1; i++){
            String str = t.substring(i, i+p.length());
            
            if(Long.parseLong(str) <= Long.parseLong(p)) answer++;
        }
        return answer;
    }
}
