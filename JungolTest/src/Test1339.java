import java.util.Scanner;

public class Test1339 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int N = s.nextInt();
		s.close();
		char [][] arr = new char[N][N];
		char c = 'A';
		if(N<1 || N>100 || N%2==0) {
			System.out.println("INPUT ERROR");
		}else {
			for(int i=N/2; i>=0; i--) {
				for(int j=i; j<N-i; j++) {
					arr[j][i] = c++;
					if(c > 'Z') c='A';
				}
			}

			for(int i=0; i<arr.length; i++) {
				for(int j=0; j<arr[i].length; j++) {
					// null°ª ÁÖÀÇ
					 if(arr[i][j] == '\0') System.out.print("  ");
		                else System.out.print(arr[i][j] + " ");
				}System.out.println();
			}
		}
	}
}
