class Solution {
    public int[] solution(String s) {
   	int[] answer = new int[2]; //[이진 변환한 횟수, 제거된 0의 총 갯수]


		while (!s.equals("1")) {
			int delete = 0; 
			for(int i=0; i<s.length(); i++) {
				if(s.charAt(i) == '1') {
					delete++;
				}else {
					answer[1]++;
				}
			}
			s = Integer.toBinaryString(delete);
			answer[0]++;
		}
        
        
        return answer;
    }
}
