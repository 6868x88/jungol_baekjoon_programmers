import java.util.Scanner;


public class Test2857 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		char arr[][] = new char[5][15];
		
		for(int i=0; i<arr.length; i++) {
			String str = s.nextLine();
			for(int j=0; j<str.length(); j++) {
				arr[i][j] = str.charAt(j);
			}
		}
		
		for(int i=0; i<15; i++) {
			for(int j=0; j<5; j++) {
				
				//공백일 경우(문자가 없는 경우) 건너뛰기 
				if(arr[j][i] == '\0') continue;
				System.out.print(arr[j][i]);
			}
		}
		
		
		s.close();
	}
}
