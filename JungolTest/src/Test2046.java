import java.util.Scanner;

public class Test2046 {
	int num;
	int num1;
	
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);	
		
		int num = s.nextInt();
		int num1 = s.nextInt();
		
		if(num1 == 1) {
			case1(num);
		} else if(num1 == 2) {
			case2(num);
		} else if(num1 == 3) {
			case3(num);
		} else {
			System.out.println("");
		}

	}

	static void case1(int num){
		int arr[][] = new int[num][num];
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] =i+1;
				System.out.print(arr[i][j]+" ");
			}System.out.println();
		}
	}
	
	static void case2(int num) {
		int arr[][] = new int[num][num];
		
		for(int i=0; i<arr.length; i++) {
			if(i%2==0) {
				for(int j=1; j<=arr[i].length; j++) {
					System.out.print(j+" ");
				}
			} else {
				for(int j=arr[i].length; j>=1; j--) {
					System.out.print(j+" ");
				}
			}System.out.println();
		}
	
		
	}
	
	static void case3(int num) {
		int arr[][] = new int[num][num];
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = (i+1)*(j+1);
				
				System.out.print(arr[i][j]+" ");
			}System.out.println();
		}
	}
	
	
}
