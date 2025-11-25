using System;

class Solution
{
    public long solution(int price, int money, int count)
    {
            long result = 0; --오버플로우 때문에 형변환 필요

            for (int i = 1; i <= count; i++) { 
                result += price *i;
            }
            result = result - money;
        if(result <=0) {result = 0;}
        return result;
    }
}
