
import java.util.*;


public class Test198 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		Person dad = new Person(s.nextInt(), s.nextDouble());
		Person mom = new Person(s.nextInt(), s.nextDouble());
		
		int h = 0;
		
		
		Student st = new Student();
		st.calc_h(mom.height, dad.height);
		st.calc_w(mom.weight, dad.weight);
		
		
		
		
		s.close();
	}
}

class Person{
	int height;
	double weight;
	
	Person(int height, double weight){
		this.height = height;
		this.weight = weight;
	}
	
}

class Student{
	
	
	void calc_h(int a, int b) {
		int h = ((a+b)/2)+5;
		System.out.println("height : "+h+"cm");
	}
	void calc_w(double a, double b) {
		double w = ((a+b)/2)-4.5;
		System.out.printf("weight : %.1fkg",w);
	}
}