import java.util.Scanner;

public class Test10871 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int N =s.nextInt();
		int X = s.nextInt();
		
		int arr[] = new int[N];
		for (int i=0; i<arr.length; i++) {
			arr[i] = s.nextInt();
			if(arr[i] < X) {
				System.out.print(arr[i]+" ");
			}
		}
		s.close();
	}
}
