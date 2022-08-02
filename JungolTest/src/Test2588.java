import java.util.Scanner;

public class Test2588 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num1 = s.nextInt();
		int num2 = s.nextInt();
		s.close();
		
		int res1 = num1 * ((num2 % 100) % 10);
		int res2 = num1 * ((num2 % 100) / 10);
		int res3 = num1 * (num2/100);
		
		System.out.println(res1);
		System.out.println(res2);
		System.out.println(res3);
		
		
		System.out.println(num1*num2);
		
	}

}
