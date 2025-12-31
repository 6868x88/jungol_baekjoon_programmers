class Solution {
    public int strStr(String haystack, String needle) {
     	if(haystack.contains(needle) == false) {
			return -1;
		}else {
			return haystack.indexOf(needle);
		}
		
    }
}
