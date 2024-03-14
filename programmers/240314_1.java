/*
나머지가 1이 되는 수 찾기
*/

import java.util.*;
class Solution {
    public int solution(int n) {
        int answer = 0;
        int i = 0;

		while (i<n) {
			i++;
			if(n % i == 1) {answer = i; break;}
		}

        return answer;
    }
}
