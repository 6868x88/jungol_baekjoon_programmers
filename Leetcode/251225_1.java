class Solution {
    public int myAtoi(String s) {

        if (s == null || s.length() == 0) return 0;

        int n = s.length();
        int sign = 1;
        long answer = 0;
        int i = 0;

        // 1) 공백 스킵
        while (i < n && s.charAt(i) == ' ') {
            i++;
        }

        // 공백만 있는 문자열
        if (i == n) return 0;

        // 2) 부호 처리
        if (s.charAt(i) == '+') {
            i++;
        } else if (s.charAt(i) == '-') {
            sign = -1;
            i++;
        }

        // 3) 숫자 처리
        while (i < n && Character.isDigit(s.charAt(i))) {
            int digit = s.charAt(i) - '0';

            // 범위 제한
            if (answer > (Integer.MAX_VALUE - digit) / 10) {
                return sign == 1 ? Integer.MAX_VALUE : Integer.MIN_VALUE;
            }

            answer = answer * 10 + digit;
            i++;
        }

        return (int) (answer * sign);
    }
}
