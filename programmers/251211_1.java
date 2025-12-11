class Solution {
    public int solution(String s) {
		int answer = 0;	
		char c = s.charAt(0);
	
		int x = 0; //첫 글자의 갯수
		int y = 0; //그 외 글자의 갯수
		
		for(int i=0; i<s.length(); i++) {
			char d = s.charAt(i);
			
			if(x == y) {
				if(x != 0) {answer++;}
				c = d;
				x = y = 0;
			}
			
			if(c == d) {x++;}
			else {y++;}
			
		}

		answer++;
		
        return answer;
    }
}
