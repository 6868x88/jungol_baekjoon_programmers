import java.util.*;


public class Test602 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		String arr[] = new String[5];
		for(int i=arr.length-1; i>=0; i--) {
			arr[i] = s.next();
		}
		
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		
		s.close();
	}

}
