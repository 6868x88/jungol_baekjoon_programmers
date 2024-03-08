/*
소수 만들기
*/


import java.util.*;

class Solution {
    public int solution(int[] nums) {
        int answer = -1;
        
        List<Integer> list = new ArrayList<Integer>();
        List<Integer> pri_list = new ArrayList<Integer>();
        int sum = 0;
        
        
        //3개 뽑아서 숫자 합 만들기
        for(int i=0; i<nums.length; i++){
            for(int j=i+1; j<nums.length; j++){
                for(int k=j+1; k<nums.length; k++){
                    sum = nums[i] + nums[j] + nums[k];
                    list.add(sum);
                }
            }
        }
        
        //소수 찾기
        for(int i:list){
            if(calc(i)){pri_list.add(i);};
            
            answer = pri_list.size();
        }
        
        
        return answer;
    }
    
  
    public boolean calc (int num){
        for(int i=2; i<=Math.sqrt(num); i++){
            if(num % i ==0){
                return false;
            }
        }
        return true;
    }
    
}
