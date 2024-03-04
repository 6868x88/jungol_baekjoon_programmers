import java.util.*;

class Solution {
    public int[] solution(int[] array, int[][] commands) {
        int[] answer = {};
        answer = new int [commands.length];
        for(int i=0; i<commands.length; i++){
            List<Integer> test = new ArrayList<Integer>();
            for(int j=commands[i][0]-1; j<commands[i][1]; j++){
                test.add(array[j]);
            }
            Collections.sort(test);
            answer[i] = test.get(commands[i][2]-1);
        }

        return answer;
        
    }
}
