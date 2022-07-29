import java.util.*;

public class Test598 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		while(true) {
			char c = s.next().charAt(0);
			int num = c;

			if(num>=48 && num<=57) {
				System.out.println(num);
			} else if(num>=65 && num<=90) {
				System.out.println(c);
			} else if(num>=97 && num<=122){
				System.out.println(c);
			} else {
				break;
			}
		}
		s.close();
	}
}
