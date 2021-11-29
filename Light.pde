class Light {
  PVector position;  // Position
  PVector velocity;  // Motion
  PVector gravity;   // Gravity
  float age = 0;     // Current age, tracked for removing element that is too old
  float maximumAge;  // No particle should be older than this value
  color lightColor;  // Partially randomized color of a light element

  Light(PVector position) {
    this.position = position.copy();
    velocity = new PVector(random(50, 200), 0);  // Random speed
    velocity.rotate(radians(random(0, 360)));    // Random direction
    gravity = new PVector(0, 200);               // Particles drop down
    maximumAge = random(0.5, 2.0);               // Different ages for different particles
    lightColor = color(255,50, 0);                // red color
  }

  void drawLight() {
    fill(lightColor);
    ellipse(position.x, position.y,10, 10);
  }

  void update() {
    position.add(PVector.mult(velocity, 1/frameRate));
    velocity.add(PVector.mult(gravity, 1/frameRate));
    age += 1/frameRate;
  }

  boolean isOver() {
    return age > maximumAge;
  }
}
