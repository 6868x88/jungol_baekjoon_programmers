package Test618;


import java.util.*;


public class Test618 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		List<Student> list = new ArrayList<>();
		
		Student s1 = new Student(s.next(), s.nextInt(), s.nextDouble());
		Student s2 = new Student(s.next(), s.nextInt(), s.nextDouble());
		Student s3 = new Student(s.next(), s.nextInt(), s.nextDouble());
		Student s4 = new Student(s.next(), s.nextInt(), s.nextDouble());
		Student s5 = new Student(s.next(), s.nextInt(), s.nextDouble());
		
		list.add(s1);
		list.add(s2);
		list.add(s3);
		list.add(s4);
		list.add(s5);
		
		
		s.close();
		
		Collections.sort(list, new StudentCompareName());
		System.out.println("name");
		
		//Iterator 사용
		Iterator<Student> it = list.iterator();
		while(it.hasNext()) {
			Object ob = it.next();
			System.out.println(ob);
		}
		
		
		//sort사용
		Collections.sort(list, new StudentCompareWeight());
		System.out.println("\nweight");
		for(int i=0; i<5; i++) {
			System.out.println(list.get(i));
			}
		
	}
}

class Student{
	String name;
	int height;
	double weight;
	
	Student(String name, int height, double weight){
		this.name = name;
		this.height = height;
		this.weight = weight;
	}
	
	@Override
    public String toString() {
        return name+" "+height+" "+weight;
    }
}

class StudentCompareWeight implements Comparator<Student>{

	@Override
	public int compare(Student o1, Student o2) {
		if(o1.weight < o2.weight) return 1;
		if(o1.weight > o2.weight) return -1;
		
		return 0;
	}
	
}

class StudentCompareName implements Comparator<Student>{

	@Override
	public int compare(Student o1, Student o2) {
		if(o1.name.charAt(0) < o2.name.charAt(0)) return -1;
		if(o1.name.charAt(0) > o2.name.charAt(0)) return 1;
		
		return 0;
	}
	
}
