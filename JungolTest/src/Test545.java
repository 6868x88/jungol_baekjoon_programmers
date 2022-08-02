import java.util.Scanner;

public class Test545 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int count_3 = 0;
		int count_5 = 0;
		int arr[] = new int[10];

		for(int i=0; i<arr.length; i++) {
			arr[i] = s.nextInt();

			if(arr[i] % 3 == 0 && arr[i] !=0) {
				count_3 ++;
			} 
			if(arr[i] % 5 == 0 && arr[i] !=0) {
				count_5 ++;
			}

		}
		s.close();	
		System.out.println("Multiples of 3 : "+count_3);
		System.out.println("Multiples of 5 : "+count_5);

	}

}
