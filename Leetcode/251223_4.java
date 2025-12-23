class Solution {
    public int lengthOfLongestSubstring(String s) {
        		int answer = 0;
		int i = 0;
		int b = 0;

		Set<Character> set = new HashSet<Character>();

		while (i < s.length()) {
			char c = s.charAt(i);
			if(!set.contains(c)) {
				set.add(c);
				i++;
				answer = Math.max(answer, set.size());
			}else {
				set.remove(s.charAt(b));
				b++;
			}
		}

        return answer;
    }
}
