import java.util.Arrays;

class Solution {
    public int solution(int[] array) {
        int answer = 0;
        Arrays.sort(array);
		int cnt = 1;
		int maxcnt = 1;
		if (array.length == 1) {answer = array[0];}
		for(int i=1; i<array.length; i++) {
			if(array[i] == array[i-1]) {
				cnt++;
			} else {cnt = 1;}
			
			if(maxcnt <cnt) {
				maxcnt = cnt;
				answer = array[i];
			}else if (maxcnt == cnt) {
				answer = -1;
			}
		}
        return answer;
    }
}
