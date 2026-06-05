import java.util.Iterator;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;

public class DemoList {

    public static void main(String[] args) {

        LinkedList<Object> buffer = new LinkedList<>();

        buffer.add("Sujith");
        buffer.add(12);
        buffer.add(false);
        buffer.add(5.6);
        buffer.add('S');

        Queue<String> store =
                new PriorityQueue<>((a, b) -> b.compareTo(a));

        store.offer("Spring Boot");
        store.offer("Django");

        System.out.println(store);

        Iterator<Object> it = buffer.iterator();

        while(it.hasNext()) {

            System.out.println(it.next());
        }
    }
}