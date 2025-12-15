
class Solution {
    public String[] solution(String[] quiz) {
	   String[] answer = new String[quiz.length];
		
		    for(int i=0; i<quiz.length; i++) {
			String[] str = quiz[i].split("=");
			int c = Integer.parseInt(str[1].trim());
			
			String[] calc = str[0].trim().split(" ");
            int a = Integer.parseInt(calc[0]);
            int b = Integer.parseInt(calc[2]);
            String op = calc[1];
            			
			int result = op.equals("+") ? a + b : a - b;
			
		    answer[i] = (result == c) ? "O" : "X";
		}
        
        return answer;
    }
}
