class Solution {
    public boolean solution(int x) {
        boolean answer = true;
        int[] num = String.valueOf(x)
				.chars()
				.map(c -> c - '0')
				.toArray();
		int y = 0;
		
		for(int i=0; i<num.length; i++) {
			y += num[i];
		}
		
		if(x%y == 0) {answer = true;}
		else {answer = false;}
        
        return answer;
    }
}
