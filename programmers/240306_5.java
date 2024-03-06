/*
숫자의 표현
*/

import java.util.*;

class Solution {
    public int solution(int n) {
        int count = 0;
        for(int i=1; i<=n; i++){
            int sum = i;
            for(int j=i+1; j<=n; j++){
                sum += j;
                if(sum == n){
                    count++;
                }else if(sum>n){    //효율성때문에 넣은 코드
                    break;
                }else{
                    continue;
                }
            }
        }
        
        int answer = count+1;
        return answer;
    }
}
