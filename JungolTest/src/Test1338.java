import java.util.Scanner;

public class Test1338 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num = s.nextInt();
		s.close();
		
		char [][] arr = new char[num][num];
		char first = 'A';
		
		for(int i=0; i<arr.length; i++) {
			int k = num-1;
			for(int j=i; j<arr.length; j++) {
				arr[j][k--] = first++;
				if(first>'Z') first='A';
			}
		}
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				if(arr[i][j] == '\0') {
					arr[i][j]=' ';}
				System.out.print(arr[i][j]+" ");
			}System.out.println();
		}
	}

}
