// Annika Damstedt || 2021

import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    // Some variables
    int temp, size, pos;

    // Print a welcome message to the user
    System.out.println ("Welcome! What do you want to translate into Pig Latin (one sentence): ");
    // User provided sentence
    Scanner scanner = new Scanner(System.in);
    String sentence = scanner.nextLine();
    // Print user provided sentence
    System.out.println ("Your sentence: " + sentence);

    //Split words based on spaces
    String[] word = sentence.split(" ");

    // Translate each word in the sentence
    for (int x=0; x<word.length; x++) {
      // Change everything to lowercase
      word[x] = word[x].toLowerCase();

      // Finds position of all vowels, and adds 100 if they are 0 or below (not in the word or first)
      int a = word[x].indexOf ("a");
      int e = word[x].indexOf ("e");
      int i = word[x].indexOf ("i");
      int o = word[x].indexOf ("o");
      int u = word[x].indexOf ("u");
      if (a<=0) {
        a+=100;
      }
      if (e<=0) {
        e+=100;
      }
      if (i<=0) {
        i+=100;
      }
      if (o<=0) {
        o+=100;
      }
      if (u<=0) {
        u+=100;
      }
      int[] vowels = {a, e, i, o, u};

      if ((word[x].startsWith ("a"))||(word[x].startsWith ("e"))||(word[x].startsWith ("i"))||(word[x].startsWith("o"))||(word[x].startsWith ("u"))) {
        // Adds way if it starts with a vowel
        word[x] = word[x]+"way";
      } else if (a>50 && e>50 && i>50 && o>50 && u>50) {
        // For situations where "y" messes things up
        word[x] = word[x]+"way";
      } else {
        // Sorts array of vowels to find smallest/first occcurring
        size = vowels.length;
        for (int j=0; j<size; j++) {
          for (int k=j+1; k<size; k++) {
            if (vowels[j]>vowels[k]) {
              temp = vowels[j];
              vowels[j] = vowels[k];
              vowels[k] = temp;
            }
          }
        }
        pos = vowels[0];

        // Creates strings for different portions of the word
        String part1 = word[x].substring(0, pos);
        String part2 = word[x].substring(pos);
        // Concatenation
        word[x] = part2+part1+"ay";
      }
    }
    // Prints results!
    System.out.println ("In pig latin: ");
    for (int y=0; y<word.length; y++) {
      System.out.print (word[y] + " ");
    }
  }
}