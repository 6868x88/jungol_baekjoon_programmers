class Solution {
    public String solution(int[] food) {
        String answer = "";
		int num = 0;
		String s = "";
		
		for(int i=1; i<food.length; i++) {
			num = food[i]/2; //반복 횟수
			answer += String.valueOf(i).repeat(num);
		}
		s = new StringBuilder(answer).reverse().toString();
		answer += "0";
		answer += s;
        
        return answer;
    }
}
