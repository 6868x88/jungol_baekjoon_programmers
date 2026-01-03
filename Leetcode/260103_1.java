class Solution {
    public int jump(int[] nums) {
        int jumps = 0;        // 점프 횟수
        int currentEnd = 0;   // 현재 점프로 도달 가능한 끝 인덱스
        int farthest = 0;     // 다음 점프로 도달 가능한 최대 인덱스

        for (int i = 0; i < nums.length - 1; i++) {
            farthest = Math.max(farthest, i + nums[i]);

            // 현재 점프 범위의 끝에 도달했을 때
            if (i == currentEnd) {
                jumps++;
                currentEnd = farthest;
            }
        }
        return jumps;
    }
}
