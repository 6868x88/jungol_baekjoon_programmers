/*
x만큼 간격이 있는 n개의 숫자
*/


class Solution {
    public long[] solution(int x, int n) {
        long [] answer = new long [n];
		
		for(long i=1; i<=answer.length; i++) { //long 타입으로 해서 풀어야함 (테스트 케이스 13,14번)
			answer[(int)i-1] = i*(long)x;   
		}
        return answer;
    }
}
