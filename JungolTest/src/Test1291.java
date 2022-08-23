import java.util.Scanner;

public class Test1291 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int s = 0 , e = 0;

		while(true) {
			
			s = sc.nextInt();
			e = sc.nextInt();
			
			if(s<2 || s>9 || e<2 || e>9) {
				System.out.println("INPUT ERROR!");
				continue;
			}else {
				if(s>e) {
					for(int i=1; i<10; i++) {
						for(int j=s; j>=e; j--) {
							int num = j;
							System.out.printf(num+" * "+i+" = "+"%2d   ",num*i);
						}
						System.out.println();
					}
				} else {
					
					for(int i=1; i<10; i++) {
						for(int j=s; j<=e; j++) {
							int num = j;
							System.out.printf(num+" * "+i+" = "+"%2d   ",num*i);
						}
						System.out.println();
					}
					
				}
				break;
				
			}
		}

	}
}

