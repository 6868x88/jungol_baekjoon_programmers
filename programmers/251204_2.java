class Solution {
    public String solution(String s, int n) {
        String answer = "";
        char[] carr = s.toCharArray();
        n = n % 26;

        for (int i = 0; i < carr.length; i++) {
            int num = (int) carr[i];

            if (num == 32) { // 공백
                answer += " ";
                continue;
            }

            // 대문자
            if (num >= 65 && num <= 90) {
                num += n;
                if (num > 90) num -= 26;
            }
            // 소문자
            else if (num >= 97 && num <= 122) {
                num += n;
                if (num > 122) num -= 26;
            }

            answer += (char) num;
        }
        return answer;
    }
}
