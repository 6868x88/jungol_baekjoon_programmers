import java.util.Scanner;


public class Test1658 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num1 = s.nextInt();
		int num2 = s.nextInt();


		System.out.println(GCD(num1, num2));	
		System.out.println(LCM(num1, num2));
		s.close();
	}

	//최대공약수
	static int GCD(int num1 , int num2) {
		int gcd = 0 ;
		for(int i=1; i<=num1; i++) {
			if(num1 % i == 0 && num2 % i ==0) {
				gcd = i;
			}

		}
		return gcd;
	}
	
	//최소공배수
	static int LCM(int num1, int num2) {
		int lcm = 0;
		
		for(int i=num1*num2; i>=num1; i--) {
			if(i % num1 == 0  && i % num2 == 0) {
				lcm = i;
			}
		}
		
		return lcm;
	}
}
