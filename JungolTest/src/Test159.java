import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Test159 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num = s.nextInt();
		Integer arr[] = new Integer [num];
		for(int i=0; i<arr.length; i++) {
			arr[i] = s.nextInt();
		}
		Arrays.sort(arr, Collections.reverseOrder());

		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		s.close();
	}
}