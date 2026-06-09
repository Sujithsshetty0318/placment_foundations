import java.io.*;
import java.util.*;

// POJO Class
class Feedback implements Serializable {

    private String trainerName;
    private String batchId;
    private String studentUsn;
    private double rating;
    private String comments;

    public Feedback(String trainerName, String batchId,
                    String studentUsn, double rating, String comments) {

        this.trainerName = trainerName;
        this.batchId = batchId;
        this.studentUsn = studentUsn;
        this.rating = rating;
        this.comments = comments;
    }

    public String getStudentUsn() {
        return studentUsn;
    }

    @Override
    public String toString() {
        return "Trainer Name : " + trainerName +
                "\nBatch ID     : " + batchId +
                "\nStudent USN  : " + studentUsn +
                "\nRating       : " + rating +
                "\nComments     : " + comments +
                "\n---------------------------";
    }
}

public class FeedbackDemo {

    public static void main(String[] args) {

        // Creating List
        List<Feedback> feedbackList = new ArrayList<>();

        feedbackList.add(new Feedback(
                "Ravi Kumar",
                "B101",
                "4SF22CS001",
                4.5,
                "Excellent teaching"));

        feedbackList.add(new Feedback(
                "Anitha",
                "B102",
                "4SF22CS002",
                4.0,
                "Good explanations"));

        feedbackList.add(new Feedback(
                "Suresh",
                "B103",
                "4SF22CS003",
                3.8,
                "Need more practical sessions"));

        // STORE OBJECTS INTO FILE
        try {

            FileOutputStream fos = new FileOutputStream("feedback.dat");
            ObjectOutputStream oos = new ObjectOutputStream(fos);

            oos.writeObject(feedbackList);

            oos.close();
            fos.close();

            System.out.println("Feedback objects stored successfully.");

        } catch (Exception e) {
            System.out.println(e);
        }

        // READ FEEDBACK BY USN
        Scanner sc = new Scanner(System.in);

        System.out.print("\nEnter USN to search: ");
        String usn = sc.nextLine();

        try {

            FileInputStream fis = new FileInputStream("feedback.dat");
            ObjectInputStream ois = new ObjectInputStream(fis);

            List<Feedback> list =
                    (List<Feedback>) ois.readObject();

            boolean found = false;

            for (Feedback f : list) {

                if (f.getStudentUsn().equalsIgnoreCase(usn)) {

                    System.out.println("\nFeedback Found");
                    System.out.println(f);
                    found = true;
                }
            }

            if (!found) {
                System.out.println("No feedback found for this USN.");
            }

            ois.close();
            fis.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}