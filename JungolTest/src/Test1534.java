import java.util.Scanner;


public class Test1534 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int b = s.nextInt();
		s.close();

		switch(b) {
		case 2:
			System.out.println(Integer.toBinaryString(n));
			break;
		case 8:
			System.out.println(Integer.toOctalString(n));
			break;
		case 16:
			String hex = Integer.toHexString(n);
			System.out.println(hex.toUpperCase());
			
			break;

		default:
			break;
		}

	}
}
