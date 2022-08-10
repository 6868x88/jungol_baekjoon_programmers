import java.util.Scanner;

public class Test8958 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		
		int num = s.nextInt();
		for(int k=0; k<num; k++) {
			int score = 0;
			
			String str= s.next();
			String arr[] = str.split("X");
			
			for(int i=0; i<arr.length; i++) {
				if(arr[i].length()==0) {
					continue;
				}else {
					int n = arr[i].length();
					for(int j=1; j<=n; j++) {
						score += j;
					}
				}
			}
			System.out.println(score);
			
		}
		
		s.close();
	}
}
