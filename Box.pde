// A rectangular box
class Box {
  Vec2 [] cornerPointsInPixelWorld, cornerPointsInBox2DWorld;
  Body body;
  Vec2 center;
  // Constructor
  Box(float x, float y) {
    center = new Vec2(x,y);
    cornerPointsInPixelWorld = new Vec2[4];
    cornerPointsInPixelWorld [0] = new Vec2(-15, 25);
    cornerPointsInPixelWorld [1] = new Vec2(15, 0);
    cornerPointsInPixelWorld [2] = new Vec2(20, -15);
    cornerPointsInPixelWorld [3] = new Vec2 (-30, 10);

    cornerPointsInBox2DWorld = new Vec2[cornerPointsInPixelWorld.length];
    //Convert pixel to box2d world
    //ArrayList <Vec2> cornerPointsInBox2DWorld = new ArrayList<Vec2>(); 
    for (int i =0; i<cornerPointsInPixelWorld.length; i++) {
      //cornerPointsInBox2DWorld.add(box2d.coordPixelsToWorld(cornerPoints[i]));
      cornerPointsInBox2DWorld [i] = box2d.vectorPixelsToWorld(cornerPointsInPixelWorld [i]);
    }
    //Shape
    PolygonShape polygonShape = new PolygonShape();
    polygonShape.set(cornerPointsInBox2DWorld, cornerPointsInBox2DWorld.length);

    //Body defination and body.
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bodyDef);

    //Fixture
    body.createFixture(polygonShape, 1.0);

    //give the shape some initial velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

  // Drawing the box
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    Fixture fixture = body.getFixtureList();
    PolygonShape polygonShape = (PolygonShape)fixture.getShape();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    fill(175);
    stroke(0);
    beginShape();
    for (int i =0; i<polygonShape.getVertexCount(); i++) {
      Vec2 verts = box2d.vectorWorldToPixels(polygonShape.getVertex(i));
      vertex(verts.x, verts.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
