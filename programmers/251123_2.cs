public class Solution {
    public string solution(string s) {
            int num = s.Length / 2;
            string answer = "";

            if (s.Length % 2 == 0)
            {   
                answer = s.Substring(num - 1, 2);
            }
            else {
                answer = s.Substring(num, 1);
            }
        return answer;
    }
}
