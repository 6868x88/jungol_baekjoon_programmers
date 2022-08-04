import java.util.Scanner;

public class Test1303 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int m = s.nextInt();
		int start = 1; 
		
		int arr[][] = new int[n][m];
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = start++;
				System.out.print(arr[i][j]+" ");
			}System.out.println();
		}
		s.close();
	}

}
