import java.util.Scanner;


public class Test1047 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		int ipt = s.nextInt();
		s.close();

		int first=1,second = 1;
		int third = 0;

		if(ipt>2 && ipt<=40) {
			for(int i = 2; i<ipt; i++) {
				third = first + second;
				first = second;
				second = third;
			}
			System.out.println(third);
		} else if(ipt == 1) {
			System.out.println(1);
		} else if (ipt == 2) {
			System.out.println(1);
		}else {}
		
	}

}
