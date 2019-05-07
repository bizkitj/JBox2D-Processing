class Boundary {
  Body boundaryBody;
  Vec2 centerPoint;
  float w, h;
  // Constructor
  Boundary (Vec2 center, float w, float h) {
    this.centerPoint = center;
    this.w = w;
    this.h = h;

    //Body defination and body.
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.STATIC;
    //bodyDef.position.set(box2d.vectorPixelsToWorld(center)); // not working.
    bodyDef.position.set(box2d.coordPixelsToWorld(center.x,center.y));

    boundaryBody = box2d.createBody(bodyDef);

    //Shape
    PolygonShape box = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    box.setAsBox(box2dW, box2dH);
    //edge.set(box2d.coordPixelsToWorld(startX, startY), box2d.coordPixelsToWorld(endX, endY));

    //Fixture
    boundaryBody.createFixture(box, 1.0);
  }

  // Drawing the edge
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(boundaryBody);
    Vec2 localCenter = boundaryBody.getPosition();
    pushStyle();
    fill(#4D56F0);
    stroke(1);
    rectMode(CENTER);
    rect(centerPoint.x, centerPoint.y, w, h);
    popStyle();

    pushStyle();
    strokeWeight(8);
    stroke(255, 0, 0);
    //point(centerPoint.x, centerPoint.y);
    Vec2 loc =  box2d.coordWorldToPixels(localCenter);
    point(loc.x, loc.y);
    popStyle();
  }
}
