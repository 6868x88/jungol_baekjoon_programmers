import java.util.*;
class Solution
{
    public int solution(int []A, int []B)
    {
        int answer = 0;

        Arrays.sort(A);
        Arrays.sort(B);

        int count = 0;

        for(int i = B.length -1 ; i >= 0 ; i-- ){
            answer += A[count] * B[i];
            count++;
        }

        return answer;
    }
}
