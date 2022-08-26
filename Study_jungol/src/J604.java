import java.util.Scanner;

public class J604 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String arr[] = new String[10];
		
		for(int i=0; i<arr.length; i++) {
			arr[i] = s.next();
		}
		String c = s.next();
		
		for(int i=0; i<arr.length; i++) {
			
			if(arr[i].lastIndexOf(c) == arr[i].length()-1)
				System.out.println(arr[i]);
		}
		
		s.close();
	}
}