import java.util.*;
class Solution {
    public int[] solution(int n) {
		Set<Integer> set = new HashSet<Integer>();

		for (int i = 2; i * i <= n; i++) {
			while (n % i == 0) {
				set.add(i);
				n /= i;
			}
		}

		if (n > 1) {set.add(n);}
		int[] answer = set.stream()
						  .sorted()
						  .mapToInt(Integer::intValue)
						  .toArray();
        return answer;
    }
}
