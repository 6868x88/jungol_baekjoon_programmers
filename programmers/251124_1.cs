

public class Solution {
    public string solution(string phone_number) {
    return phone_number.Substring(phone_number.Length-4).PadLeft(phone_number.Length, '*');
    }
}
