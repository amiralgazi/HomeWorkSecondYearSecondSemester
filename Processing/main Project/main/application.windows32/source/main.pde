import java.util.*;


boolean TRUE = true;
boolean FALSE = false;
boolean DEBUG = TRUE;

//MAIN PROGRAM GLOBALS
int windowWidth, windowHeight;
//blue FB
int bgColorR = 109;
int bgColorG = 132;
int bgColorB = 180;

LinkedList<Person> people;
LinkedList<Task> tasks;
BaseWheel base;
TopWheel top;

int statusFlag; //can be -1 for waiting, 0 for pick task, 1 for task picked

void setup() {
  this.windowWidth = displayWidth;
  this.windowHeight = displayHeight;
  size(windowWidth, windowHeight); //GOING FULL SCREEN BABY ! 
  //setting main window bg

  background(bgColorR, bgColorG, bgColorB);  
  //instansiate people
  Person david = new Person("David", new PersonColor(65, 191, 191));
  Person anna = new Person("Anna", new PersonColor(80, 191, 65));
  Person raziel = new Person("Raziel", new PersonColor(204, 73, 102));
  people = new LinkedList();
  david.increaseAmountOfTasks();
  david.increaseAmountOfTasks();
  anna.increaseAmountOfTasks();
  raziel.increaseAmountOfTasks();
  people.add(david);
  people.add(anna);
  people.add(raziel);
  LinkedList<Task> myList = new LinkedList();
  //instansiate tasks

  tasks = new LinkedList();
  tasks.add( new Task("Laundry", "laundry.png", 1));
  tasks.add( new Task("Laundry", "laundry.png", 1));
  tasks.add( new Task("Laundry", "laundry.png", 1));
  tasks.add( new Task("Brooming", "broom.png", 1));
  tasks.add( new Task("Brooming", "broom.png", 1));
  tasks.add( new Task("Dishes", "plate.png", 1));
  tasks.add( new Task("Dishes", "plate.png", 1));
  tasks.add( new Task("Dishes", "plate.png", 1));
  tasks.add( new Task("Dishes", "plate.png", 1));
  tasks.add( new Task("Trash", "trash.png", 1));
  tasks.add( new Task("Trash", "trash.png", 1));
  tasks.add( new Task("Trash", "trash.png", 1));
  tasks.add( new Task("Trash", "trash.png", 1));
  tasks.add( new Task("Trash", "trash.png", 1));

  int BaseWheelSize = windowWidth/2;
  int tasksNumber;
  statusFlag = -1;
  base = new BaseWheel(windowWidth/2, windowHeight/2, BaseWheelSize, BaseWheelSize, people, tasks.size());
  base.generate();
  top = new TopWheel(windowWidth/2, windowHeight/2, BaseWheelSize, BaseWheelSize, tasks,people, raziel);
  top.generateWaitingPosition();


  //everything is dead after this
  //noLoop();
}

//mouse click listener
void mousePressed() {
  if (top.overCircle(windowWidth/2, windowHeight/2, 500)) {
    switch(statusFlag) {
      case(-1):
      {
        System.out.println("User clicked, showing tasks");
        top.generateTaskChooser();
        statusFlag = 0;
        break;
      }
      case(0):
      {
        
        System.out.println("Task picked, showing status");
        //need to initiate scrolling wheel
        //need to retrieve what the user clicked on
        top.generateTaskAmountChooser();
        statusFlag = 1;
        break;
      }
      case(1):
      {
        System.out.println("Task amount picked, moving to waiting");

        top.generateWaitingPosition();
        statusFlag = -1;
        break;
      }
    }
  }
}

//key up listener
void keyReleased() {
  if (key == CODED) {
    if (keyCode == 39) {
      //right key
      if (statusFlag ==0) {
        top.generateTaskChooser();
      } else if (statusFlag == 1) {
        top.generateTaskAmountChooser();
      }
    } else if (keyCode == 37) {
      //left key
      if (statusFlag ==0) {
        top.generateTaskChooser();
      } else if (statusFlag == 1) {
        top.generateTaskAmountChooser();
      }
    }
  }
}

void draw() {
  this.top.listen();
}

