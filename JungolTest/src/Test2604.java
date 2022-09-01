import java.util.Scanner;


public class Test2604 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String str = s.next();
		s.close();
		
		int count_5cm = 0;
		int count_10cm = 1; //첫 그릇
		
		String arr[] = str.split("");
		
		for(int i=0; i+1<str.length(); i++){
			//겹친 그릇 수 세기
 			if((arr[i]+arr[i+1]).equals("))") || (arr[i]+arr[i+1]).equals("((")) {
 				count_5cm++;
			} else {
				count_10cm++;
			}
		}
		
		System.out.println(count_5cm*5 + count_10cm*10);
		
	}
}
