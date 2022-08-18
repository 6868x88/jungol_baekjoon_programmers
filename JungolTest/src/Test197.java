
import java.util.*;


public class Test197 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		Squre sq = new Squre();
		sq.x1_1=s.nextInt();
		sq.y1_1=s.nextInt();
		sq.x1_2=s.nextInt();
		sq.y1_2=s.nextInt();
		
		sq.x2_1=s.nextInt();
		sq.y2_1=s.nextInt();
		sq.x2_2=s.nextInt();
		sq.y2_2=s.nextInt();
				
		s.close();
		
		int a, b, c, d;
		a = sq.compareSmall(sq.x1_1, sq.x2_1);
		b = sq.compareSmall(sq.y1_1, sq.y2_1);
		c = sq.compareBig(sq.x1_2, sq.x2_2);
		d = sq.compareBig(sq.y1_2, sq.y2_2);
		
		System.out.print(a + " " + b + " " + c +" "+ d);
		
		
	}
}


class Squre{
	int x1_1, y1_1;
	int x1_2, y1_2;
	int x2_1, y2_1;
	int x2_2, y2_2;
	
	int compareBig(int i, int j){
		return (i>j)? i : j;
	}
	int compareSmall(int i, int j) {
		return(i<j)? i : j;
	}
	
}