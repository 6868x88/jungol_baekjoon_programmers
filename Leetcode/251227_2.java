import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

class Solution {
    public boolean isValid(String s) {
		
		char[] arr = s.toCharArray();
		
		Stack<Character> stack = new Stack<Character>();
		Map<Character, Character> map = new HashMap<Character, Character>();
		map.put(')', '(');
		map.put('}', '{');
		map.put(']', '[');
		
		for(int i=0; i<arr.length; i++) {
			if(map.containsValue(arr[i])) {
				stack.push(arr[i]);
			}else if(map.containsKey(arr[i])) {
				if(stack.isEmpty() || map.get(arr[i]) != stack.pop()) {
					return false;
				}
			}
		}

        return stack.isEmpty();
    }
}
