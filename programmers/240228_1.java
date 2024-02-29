/* 
추억점수
*/

import java.util.*;

class Solution {
    public int[] solution(String[] name, int[] yearning, String[][] photo) {
        int[] answer = {};
        
        Map<String, Integer> map = new HashMap<>();
        
        for(int i=0; i<name.length; i++){
            map.put(name[i], yearning[i]);
        }
        
        answer = new int[photo.length];
        
        int score = 0;
        
        for(int i=0; i<photo.length; i++){
            for(int j=0; j<photo[i].length; j++){
                score += map.getOrDefault(photo[i][j],0);
            }
            answer[i] = score;
            score = 0;
        }
        
        return answer;
    }
}
