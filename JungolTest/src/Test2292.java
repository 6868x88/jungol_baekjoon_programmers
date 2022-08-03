import java.util.Scanner;

public class Test2292 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num = s.nextInt();
		s.close();
		
		int sum = 1, i = 1;
		while(true) {
			if(num <=sum) break;
			sum += 6 * i;
			i++;
		}
		System.out.println(i);
	}

}
