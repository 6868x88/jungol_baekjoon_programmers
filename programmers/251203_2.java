import java.util.ArrayList;

class Solution {
    public int[] solution(int[] arr) {

        int min = arr[0];
		ArrayList<Integer> answer = new ArrayList<>();
		
		if(arr.length == 1) {
			answer.add(-1);
		} else {
			for(int i=0; i<arr.length; i++) {
				min = Math.min(min, arr[i]);
			}	
			
			for(int i=0; i<arr.length; i++) {
				if (arr[i] != min)
					answer.add(arr[i]);
			}
			
		}
		
        return answer.stream().mapToInt(i -> i).toArray();
    }
}
