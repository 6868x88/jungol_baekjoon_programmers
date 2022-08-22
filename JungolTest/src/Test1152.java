import java.util.Scanner;

public class Test1152 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String str = s.nextLine();
		String arr[] = str.split(" ");
		
		int count = 0;
		
		for(int i=0; i<arr.length; i++) {
			//시작이 공백일 경우
			if(arr[i].equals("")) {
				continue;
			}
			count ++;
		}
		
		System.out.println(count);
		s.close();
	}
}