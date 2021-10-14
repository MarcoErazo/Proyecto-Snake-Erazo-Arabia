Snake s;
Comida c;
boolean gameOver;

void setup() {
  size(600,600);
  frameRate(10);
  s = new Snake();
  c = new Comida();
  gameOver = false;
}

void draw() {
  background(0, 191, 89);
  stroke(255);
  
  
  if(!gameOver) {
    
    c.mostrar(); 
    
  
    if(s.comer(c.getPosicion())) {
      c = new Comida(); 
      s.crecer();
    }
    
    
    if(s.getF()) {
      gameOver = true;
    }
  
    s.mostrar(); 
    s.mover(); 
    s.validarBordes(); 
    s.muerte();
  } else {
    fill(255);
    textAlign(CENTER);
    textSize(100);
    text("ACABADO!", width/2, height/2); 
    textSize(20);
    text("Buen Intento", width/2, height/2 + 50);
    text("Puntos: " + s.getPuntos(), width/2, height/2 + 100); 
  }
}
