import java.util.Scanner;

public class Test1430 {
//메서드가 아닌 방법으로 푸는게 더 좋은 풀이 같다. 꼭 다시 다른 방법으로 풀어보기	
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int A = s.nextInt();
		int B = s.nextInt();
		int C = s.nextInt();
		s.close();
		
		int num = A * B * C;
		String str = Integer.toString(num);
		
		for(int i=0; i<10; i++) {
			char c = (char)(i+'0');
			System.out.println(count(str,c));
		}
		
		
	}
	public static int count(String str, char c) {
		int count = 0;
		for(int i=0; i<str.length(); i++) {
			if(str.charAt(i) == c) {
				count++;
			}
		}
		return count;
	}
}

