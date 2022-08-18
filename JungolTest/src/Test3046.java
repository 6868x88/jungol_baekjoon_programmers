import java.util.Scanner;

public class Test3046 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int R1 = s.nextInt();
		int S = s.nextInt();
		
		int R2 = 2*S - R1;
		System.out.println(R2);
		s.close();
		
	}
}