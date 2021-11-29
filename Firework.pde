//from Example: fireworks by Tim Laue

class Firework {
  PVector position;         // Position where the firework explodes
  ArrayList<Light> lights;  // A list of the single lights that form the firework

  // Constructor
  // x: x-coordinate of firework
  // y: y-coordinate of firework
  // numOfLights: the number of Light objects that are started
  Firework(float x, float y, int numOfLights) {
    position = new PVector(x, y);
    lights = new ArrayList<Light>();
      // Create 50% "normal" lights and 50% blinking lights:

  for (int i=0; i<numOfLights; i++) {
      //if (random(0, 1) < 0.5) {
        Light newLight = new Light(position);
        lights.add(newLight);
      //} else {
      //  BlinkenLight newLight = new BlinkenLight(position);
      //  lights.add(newLight);
    }    
  }

  // Iterate over all lights to draw them
  void drawFirework() {
    for (Light l : lights) {
      l.drawLight();
    }
  }

  // Iterate over all lights to move and remove them
  void update() {
    for (Light l : lights) {
      l.update();
    }
    for (int i=lights.size()-1; i>= 0; i--) {
      if (lights.get(i).isOver()) {
        lights.remove(i);
      }
    }
  }

  // Firework can be removed, if there are no more lights left
  boolean isOver() {
    return lights.size() == 0;
  }
}
