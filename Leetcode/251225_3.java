class Solution {
    public String longestCommonPrefix(String[] strs) {
    	if(strs == null || strs.length == 0) return "";
		
		String str1 = strs[0];
		
		for(int i=0; i<str1.length(); i++) {
			char c = str1.charAt(i);
			
			// 다른 문자열 비교
			for(int j=1; j<strs.length; j++) {
				if( i >= strs[j].length() || strs[j].charAt(i) != c) {
					return str1.substring(0, i);
				}
			}
         }


        return str1;

    }
}
