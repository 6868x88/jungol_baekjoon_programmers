import java.util.Scanner;

public class Test1307 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num = s.nextInt();
		s.close();

		char[][] square = new char[num][num];
		char first = 'A';

		
		for(int i=num-1; i>=0; i--) {
			for(int j=num-1; j>=0; j--) {
				square[j][i] = first;
				first++;
				
				if(first>'Z') first='A';
			}
		}
		
		for(int i=0; i<square.length; i++) {
			for(int j=0; j<square[i].length; j++) {
				System.out.print(square[i][j]+" ");
			}System.out.println();
		}
	}
}
