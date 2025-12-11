import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Solution {
    public int solution(int n) {
        int answer = 0;
        
        List<Integer> list = new ArrayList<Integer>();
		
		int num = 3 ; //3진법
		int a = 0; 
		
		while (n / num > 0) {
			a = n % num;
			list.add(a);
			n = n / num;
		};
		
		list.add(n);
		Collections.reverse(list);
		
		for(int i=1; i<list.size(); i++) {
			int x =(int)Math.pow(num, i);
			answer += list.get(i)*x;	
		}
        return answer + list.get(0);

		/* 더 짧고 간결한 코드 
		 * String reversed = new StringBuilder(Integer.toString(n, 3)).reverse().toString();
		 * return Integer.parseInt(reversed, 3);
		 */
    }
}
