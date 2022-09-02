import java.util.Scanner;


public class Test1309 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		s.close();
		
		//출력
		for(int i=n; i-1>0; i--) {
			System.out.println(i+"! = "+ i+" * "+(i-1)+"!");
		}
		System.out.println("1! = 1");
		
		//계산 - 결과 값이 int범위를 넘어감
		long result=1; 
		for(int i=n; i>0; i--) {
			result *= i;
		}
		System.out.println(result);
	}
}
