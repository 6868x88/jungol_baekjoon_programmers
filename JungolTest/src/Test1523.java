import java.util.Scanner;

public class Test1523 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int m = s.nextInt();
		
		if(n<=100) {
		if(m == 1) {
			case1(n);
		} else if(m == 2) {
			case2(n);
		} else if(m == 3) {
			case3(n);
		}else {
			System.out.println("INPUT ERROR!");
		}
		}else {
			System.out.println("INPUT ERROR!");
		}
	}

	static void case1(int n) {
		
		for(int i=1; i<=n; i++) {
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}System.out.println();
		}
	}
	
	static void case2(int n) {
		
		for(int i=n; i>=1; i--) {
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}System.out.println();
		}
	}
	
	static void case3(int n) {
		
		for(int i=1; i<=n; i++) {
			for(int j=n; j>i; j--) {
				System.out.print(" ");
			}
			for(int j=1; j<=2*i-1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}

