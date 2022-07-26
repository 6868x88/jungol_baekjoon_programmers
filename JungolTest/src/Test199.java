
import java.util.*;


public class Test199 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int num = 0;
		num = s.nextInt();
		
		Student arr[] = new Student[num];
		
		for(int i=0; i<arr.length; i++) {
			String name = s.next();
			int kor = s.nextInt();
			int eng = s.nextInt();
			int math = s.nextInt();
			int sum = kor + eng + math;
			arr[i] = new Student(name, kor, eng, math, sum);
		}
		
		Arrays.sort(arr);
		
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		s.close();
	}

}

class Student implements Comparable<Student>{
	String name;
	int kor;
	int eng;
	int math;
	int sum;
	
	Student(String name, int kor, int eng, int math, int sum){
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.sum = kor + eng + math;
	}
	
	public String toString() {
		return name + " " + kor + " " + eng + " "+ math + " " + sum;
	}

	@Override
	public int compareTo(Student o) {
		
		if(this.sum > o.sum)  return -1;
		return 0;
	}
	
}

