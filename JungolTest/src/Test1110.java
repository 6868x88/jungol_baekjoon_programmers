import java.util.Scanner;


public class Test1110 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num= s.nextInt();
		int num2 = num; //처음 입력한 숫자 저장
		s.close();
		
		int count=0;
		
		while(true) {
			int t, o ;
			//t:입력한 숫자의 십의 자리, o:입력한 숫자의 일의 자리
			
			
			t = num/10;
			o = num%10;
			
			int result = t + o;
			if(o*10 + result%10 == num2) {
				break;
			}else {
				num = o*10 + result%10;
				count++;
			}
			
		}
		System.out.println(count+1);
	}
}
