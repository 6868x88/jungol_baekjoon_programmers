/*
소수 찾기

*/

import java.util.*;

class Solution {
    public int solution(int n) {
        int answer = 0;
        
        	for(int i=1; i<=n; i++) {
			if(solve(i)) answer++;
		}
        return answer;
    }
    
    //소수 판별
     public boolean solve(int n) {
		 
		 if(n < 2)  {return false;}
		 else if(n == 2) { return  true;}
		 else {
			 for(int i=2; i<=Math.sqrt(n); i++) {
				 if(n % i == 0) {return false;};
			 }
		 }
		 return true;
	}
}
