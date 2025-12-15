class Solution {
    public int[] solution(int numer1, int denom1, int numer2, int denom2) {
    	int a = numer1 * denom2 + numer2 * denom1;
		int b = denom1 * denom2;
		int x = a; 
		int y = b;
		
		while (b != 0) {
			int temp = a % b;
			a = b;
			b = temp;
		}
		int[] answer = {x/a, y/a};
        return answer;
    }
}
