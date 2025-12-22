import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class Solution {
    public int[] solution(int[] numlist, int n) {
	Map<Integer, Integer> map = new HashMap<Integer, Integer>(); 
		
		for(int i=0; i<numlist.length; i++) {
			map.put(numlist[i], Math.abs(numlist[i]-n));
		}
		
		List<Integer> keySet = new ArrayList<Integer>(map.keySet());
		keySet.sort(new Comparator<Integer>() {
			@Override
			public int compare(Integer n1, Integer n2) {
				int cmp =  map.get(n1).compareTo(map.get(n2));
				if (cmp != 0) {
					return cmp;
				}
				return n2.compareTo(n1);
			}
		});
		
		int[] answer = keySet.stream()
							 .mapToInt(Integer::intValue)
							 .toArray();
		
		
        return answer;
    }
}
