class Snake {
  PVector posicion, velocidad;
  int tamano, puntos;
  boolean f;
  ArrayList<PVector> cuerpo = new ArrayList<PVector>();
  
  Snake() {
    f = false; 
    tamano = 20; 
    puntos = 0; 
    posicion = new PVector(width/2, height/2); 
    velocidad = new PVector(1,1);
    
    cuerpo.add(new PVector(posicion.x, posicion.y)); 
  }
  
  
  void mostrar() {
    fill(0, 128, 60);
    stroke(0, 64, 30);
    strokeWeight(3);
    rectMode(CENTER);
    
    for(PVector c : cuerpo) {
      rect(c.x + tamano/2, c.y + tamano/2, tamano, tamano);
    }
  }
  
  
  void mover() {
    if(key == 'w') {
      posicion.y -= velocidad.y * tamano;
    } else if(key == 's') {
      posicion.y += velocidad.y * tamano;
    } else if(key == 'a') {
      posicion.x -= velocidad.x * tamano;
    } else if(key == 'd') {
      posicion.x += velocidad.x * tamano;
    }
    
   
    cuerpo.add(new PVector(posicion.x, posicion.y));
    cuerpo.remove(0); 
  }
  
  boolean comer(PVector comida) {
    PVector cabeza = cuerpo.get(cuerpo.size() - 1); 
    float distancia = dist(cabeza.x, cabeza.y, comida.x, comida.y); 
    

    if(distancia < 1) {
      return true;
    }
  
    else {
      return false;
    }
  }
  

  void muerte() {
    
    PVector cabeza = cuerpo.get(cuerpo.size() - 1);
    
    for(int i = 0; i < (cuerpo.size() - 1); i++) {

      PVector cuerpo = this.cuerpo.get(i);
      
     
      float distancia = dist(cuerpo.x, cuerpo.y, cabeza.x, cabeza.y);
      
      
      if(distancia < 1) {
        f = true; 
      }
    }
  }
  
  void crecer() {
   
    cuerpo.add(new PVector(posicion.x, posicion.y));
    puntos++; 
  }
  
  void validarBordes() {
   
    PVector cabeza = cuerpo.get(cuerpo.size() - 1);
    
    if(cabeza.x > width - tamano/2 || cabeza.x < tamano/2 || cabeza.y > height - tamano/2 || cabeza.y < tamano/2) {
      f = true; 
    }
  }
  
  int getPuntos() {
    return puntos;
  }
  
  boolean getF() {
    return f;
  }
}
