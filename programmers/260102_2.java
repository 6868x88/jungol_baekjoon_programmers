class Solution {
    public int solution(int n) {
        int cnt = Integer.bitCount(n);
		int answer = n+1;
		
		while (answer > n) {
			if(Integer.bitCount(answer) == cnt) {
				break;
			}
			answer ++;
		}
        
        return answer;
    }
}
