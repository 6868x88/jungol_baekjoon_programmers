package Test578;

import java.util.*;

public class Test578 {
	int num1, num2;
	static int result = 0;

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		calc(s.nextInt(), s.nextInt());
		s.close();
	}
	public static void calc(int num1, int num2){
		if(num1<num2) {
			for(int j = num1; j<=num2; j++) {
				System.out.println("== "+j+"dan ==");
				for(int i=1; i<10; i++) {
					result = j * i;
					System.out.printf("%d * %d = %2d\n",j,i,result);
				}
				System.out.println();
				System.out.println();
			}
		} else {
			for(int j = num2; j<=num1; j++) {
				System.out.println("== "+j+"dan ==");
				for(int i=1; i<10; i++) {
					result = j * i;
					System.out.printf("%d * %d = %2d\n",j,i,result);
				}
				System.out.println();
			}
		}
	}

}