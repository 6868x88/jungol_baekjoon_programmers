import java.util.*;

class Solution {
    public int solution(int k, int[] tangerine) {	
		int answer = 0; // 귤 종류를 최소화할 때 나올 수 있는 수
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		for(int i : tangerine) {
			map.merge(i, 1, Integer::sum);
		}
		
		List<Integer> list = new ArrayList<Integer>(map.values());
		list.sort(Comparator.reverseOrder());
		
		for(int i : list) {
			k -= i;
			answer++;
			if(k <= 0) {
				break;
			}
		}
		
        return answer;
    }
}
