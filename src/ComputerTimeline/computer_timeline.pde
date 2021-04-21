//Annika Damstedt | Computer Timeline
//Sept. 2020
boolean hover = false;
PImage Z3;
PImage ENIAC;
PImage UNIVAC;
PImage Whirlwind;
PImage IBM360;
PImage CDC;
PImage Apple;
PImage Quantum;

void setup() {
  size (900, 400);
  Z3 = loadImage ("Z3_small.png");
  ENIAC = loadImage ("ENIAC_small.png");
  UNIVAC = loadImage ("UNIVAC_small.png");
  Whirlwind = loadImage ("MIT_Whirlwind_small.png");
  IBM360 = loadImage ("IBM_360_small.png");
  CDC = loadImage ("CDC_6600_small.png");
  Apple = loadImage ("Apple_1_small.png");
  Quantum = loadImage ("IBM_Quantum_small.png");
}

void draw() {
  background (155);
  drawRef();
  histEvent (70, 125, 90, 30, "The Z3 (1941)", "The Z3 was created by Konrad Zuse in Germany. It was the first working programmable computer. It had 64 words of memory.", true, Z3);
  histEvent (150, 200, 110, 30, "The ENIAC (1946)", "The ENIAC (Electronic Numerical Integrator Computer) was invented by  J. Presper Eckert, John Mauchly, Herman H. Goldstine, and John von Neumann for the US Military. It’s purpose was for military calculations, but was unable to store programs. It contained 18000 cathode ray tubes.", false, ENIAC);
  histEvent (230, 125, 100, 30, "UNIVAC I (1951)", "The UNIVAC was invented by J. Presper Eckert and John Mauchly, who both worked on the ENIAC. The UNIVAC was the first commercially available computer in the United States, selling for about $300,000. It used tape instead of punch cards to store information.", true, UNIVAC);
  histEvent (310, 200, 133, 30, "MIT Whirlwind (1951)", "The MIT Whirlwind computer was invented by Jay Forrester and his team at MIT. This computer was the first instance of a magnetic core memory, which allowed for non volatility and random access.", false, Whirlwind);
  histEvent (390, 125, 145, 30, "IBM System/360 (1964)", "The IBM system was developed by a large group of inventors at the IBM (International Business Machines) company in the US. The IBM used the same software throughout its iterations, with changed hardware, which made it easier to switch computers.", true, IBM360);
  histEvent (470, 200, 110, 30, "CDC 6600 (1964)", "The CDC 6600 was invented by Seymour Cray in the USA, for the Control Data Corporation. The 6600 was known for its solid-state design and incredible speed, which put its price at $7-10 million.", false, CDC);
  histEvent (570, 125, 90, 30, "Apple I (1976)", "The Apple I was invented by Steve Wozniak (also known as Woz) and Steve Jobs in the US. The Apple I was one of the first at home computers, and is the computer that started the company Apple.", true, Apple);
  histEvent (650, 200, 190, 30, "IBM Quantum Computer (2017)", "The IBM quantum computer is being developed by IBM. A quantum computer is a computer that uses quantum phenomena to perform calculations. It has 50 qubits, or quantum bits, and can hold the quantum state for 90 microseconds.", false, Quantum);
}

void drawRef() {
  //Draws the timeline
  stroke (200);
  strokeWeight (8);
  line (100, 175, 800, 175);
  strokeWeight (5);
  stroke (50);
  line (100, 175, 800, 175);

  //Draws the title information
  textSize (35);
  textAlign (CENTER);
  fill (0);
  text ("Computer Timeline", 450, 40);

  //Descriptive text
  textSize (12);
  text ("The Computer Timeline includes the beginning of programming to newest innovations. From punch cards to quantum data, computers have developed significantly. By Annika Damstedt | 2020", 250, 50, 400, 300);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top, PImage image) {
  //Detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);

  //Draw a rectangle
  strokeWeight (2);
  if (hover == true) {
    fill (255, 190);
    textAlign (LEFT);
    text (description, 470, 250, 400, 200);
    image.resize (200, 0);
    image (image, 230, 250);
  } else {
    fill (255);
  }
  rect (x, y, w, h, 5);

  //Text overlay
  textAlign (LEFT);
  fill (0);
  text (title, x+5, y+20);

  //Connecting line to the timeline
  if (top == true) {
    line (x+50, y+30, x+80, y+50);
  } else {
    line (x+50, y, x+80, y-25);
  }
}
