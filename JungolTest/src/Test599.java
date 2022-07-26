import java.util.*;

public class Test599 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int arr[] =  new int[100];
		String str = s.next();
		
		for(int i=0; i<str.length(); i++) {
			char c = str.charAt(i);
			if(c>=65 && c<=90) {
				System.out.print(c);
			} else if(c>=97 && c<=122) {
				System.out.print((char)(c-32));
			}
		}
		
		s.close();
	}
}
