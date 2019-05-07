// A list for all of our rectangles
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing box2d;
ArrayList<Box> boxes;
//Boundary boundary1;
BoundaryEdge bEdge;
void setup() {
  size(400, 300);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Create ArrayLists
  boxes = new ArrayList<Box>();

  //Boundary
  float boundaryWidth = 200.0;
  Vec2 p1 = new Vec2(width/3, height/3);
  Vec2 p2 = new Vec2(width/3 + boundaryWidth, height/3);

  //boundary1 = new Boundary(p1,boundaryWidth, 1);
  bEdge = new BoundaryEdge(p1,p2);
}

void draw() {
  background(255);
  box2d.step();

  // Display all the boxes
  for (Box b : boxes) {
    b.display();
  }
  //boundary1.display();
  bEdge.display();
}

void mousePressed() {
  Box p = new Box(mouseX, mouseY);
  boxes.add(p);
  println("Mouse pressed");
}
