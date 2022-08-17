import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class Test196 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		List<Person> list = new ArrayList<>();
		Person p1 = new Person(s.next(), s.next(), s.next());
		Person p2 = new Person(s.next(), s.next(), s.next());
		Person p3 = new Person(s.next(), s.next(), s.next());
		
		list.add(p1);
		list.add(p2);
		list.add(p3);
		
		System.out.println(Collections.min(list, new PersonNameCompare()));
		s.close();
		
	}

}

class Person{
	String name;
	String tel;
	String add;
	
	Person(String name, String tel, String add){
		this.name = name;
		this.tel = tel;
		this.add = add;
	}
	@Override
	public String toString(){
		return "name : "+name+"\ntel : "+tel+"\naddr : "+add;
	}
	
}

class PersonNameCompare implements Comparator<Person>{

	@Override
	public int compare(Person o1, Person o2) {
		
		if(o1.name.charAt(0) < o2.name.charAt(0)) return -1;
		if(o1.name.charAt(0) > o2.name.charAt(0)) return 1;
		
		return 0;
	}
	
}