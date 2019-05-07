class BoundaryEdge {
  Body boundaryBody;
  Vec2 startPoint,endPoint;
  // Constructor
  BoundaryEdge (Vec2 startPoint, Vec2 endPoint) {
    this.startPoint = startPoint;
    this.endPoint = endPoint;

    //Body defination and body.
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.STATIC;
    //bodyDef.position.set(box2d.vectorPixelsToWorld(center)); // not working.
    float distance = dist(startPoint.x,startPoint.y,endPoint.x,endPoint.y);
    
    bodyDef.position.set(box2d.coordPixelsToWorld(startPoint.x + distance/2,startPoint.y));
    boundaryBody = box2d.createBody(bodyDef);

    //Shape
    EdgeShape edge = new EdgeShape();
    edge.set(box2d.coordPixelsToWorld(startPoint.x, startPoint.y), box2d.coordPixelsToWorld(endPoint.x, endPoint.y));

    //Fixture
    boundaryBody.createFixture(edge, 1.0);
  }

  // Drawing the edge
  void display() {
    Vec2 localCenter = boundaryBody.getPosition();
    pushStyle();
    fill(#4D56F0);
    stroke(1);
    line(startPoint.x,startPoint.y,endPoint.x,endPoint.y);
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
