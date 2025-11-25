using System;

public class Solution {
    public int solution(int n) {
        int answer = 0;
        
            var str = n.ToString().ToCharArray();
            for (int i = 0; i < str.Length; i++) { 
                 answer += str[i]-48;
            }
        return answer;
    }
}
