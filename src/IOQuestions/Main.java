import java.io.*;
import java.util.Scanner;
import java.util.Random;

class Main {
  public static void main(String[] args) {
    try {
      // Questions
      String question1 = "When was the last time you tried something new?";
      String question2 = "What gets you excited about life?";
      String question3 = "What life lesson did you learn the hard way?";
      String question4 = "What's a belief you hold with which many people disagree?";
      String question5 = "What would you do differently if you knew nobody would judge you?";
      String question6 = "What is the difference between living and existing?";
      String question7 = "Have you done anything lately worth remembering?";
      String question8 = "What does your joy look like today?";
      String question9 = "Is it possible to lie without saying a word?";
      String question10 = "If you had to teach something, what would you teach?";

      // Questions Array
      String[] questions = {question1, question2, question3, question4, question5, question6, question7, question8, question9, question10};

      // Choose and ask the question
      Random r = new Random();
      int choice = r.nextInt (questions.length);
      System.out.println (questions[choice]);

      // User answer
      Scanner scanner = new Scanner(System.in);
      String answer = scanner.nextLine(); 

      // Create the file
      File file = new File ("output.txt");
      FileWriter fw = new FileWriter(file, true);
      BufferedWriter bw = new BufferedWriter(fw);
      PrintWriter pw = new PrintWriter(bw);

      // Write the question and answer to the file
      pw.println ("");
      pw.println (questions[choice]);
      pw.println (answer);
      pw.close();

      // Thanks!
      System.out.println ("Thanks for answering the question!");

    } catch (IOException ioe) {
        System.out.println ("Exception occurred:");
        ioe.printStackTrace();
    }
  }
}