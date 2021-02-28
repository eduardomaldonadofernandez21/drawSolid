//Variable que indica cuando se hace click con el ratón
boolean firstClick;
//Variable que indica cuando se dibuja el solido de revolución
boolean drawSolido;

boolean pantallaInicio;
//ArrayList donde se guardan las posiciones clickadas por el usuario
ArrayList <PVector> listaPosPerfil = new ArrayList();

//Vector que contiene las posiciones del ultimo click dado
PVector lastPoint;
//Vector que contiene las posiciones del penultimo click dado 
PVector OldPoint;

PShape objPerfil;
PShape objSolido;

void setup() {
  size(600, 600,P3D);
  firstClick = true;
  drawSolido = false;
  pantallaInicio = true;
}
void draw() {
  if(pantallaInicio){
    drawControl();
  }else{
    background(0);
    //Línea que divide la mitad de la pantalla
    fill(255, 0, 0);
    rect(width/2, 0, 5,height);
    drawPerfilSolido();
    fill(255);
    textSize(15);
    text("Pulse ENTER para mostrar controles", 10, 20);
    if(drawSolido){
      background(#c2c2c2);
      drawSolidoRevolucion();
      translate(mouseX,mouseY);
      shape(objSolido);
    }
  }
}

void mousePressed() {
  if(mouseButton == RIGHT && !pantallaInicio){
    if(firstClick && mouseX>width/2){
      lastPoint = new PVector(mouseX,mouseY,0);
      listaPosPerfil.add(lastPoint); 
      firstClick = false;
    }else if(!firstClick && mouseX>width/2){
      OldPoint = lastPoint;
      lastPoint = new PVector(mouseX,mouseY,0);
      listaPosPerfil.add(lastPoint);  
    }
  } 
  if(mouseButton == LEFT){ //Click izquierdo para limpiar
    listaPosPerfil.clear();
    firstClick = true;
    drawSolido = false;
  }
}

void keyPressed(){
  if((key == 's' || key == 'S') && !pantallaInicio){
    drawSolido = true;
  }
  if(key == ENTER){
    pantallaInicio = !pantallaInicio;
  }
}

void drawControl(){
  background (#c2c2c2); 
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  fill(255);
  text("Pulse ENTER para dibujar el perfil de solido", width/2, height/2);
  fill(0);
  text("Controles:\n Click derecho: Se dibuja el perfil del solido en el lado derecho \n Click izquierdo: Limpiar la pantalla y resetear \n Tecla s: Mostrar el sólido de revolución", width/2, height/2 + 100);
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("© Eduardo Maldonado Fernández",20,550);
}

void drawPerfilSolido(){
  objPerfil=createShape();
  // El pincel
  objPerfil.beginShape();
  objPerfil.noFill();
  objPerfil.fill(102);
  objPerfil.stroke(255, 0, 0);
  objPerfil.strokeWeight(3);
  // Puntos de la forma
  for(int i = 0; i<listaPosPerfil.size(); i++){
    objPerfil.vertex(listaPosPerfil.get(i).x, listaPosPerfil.get(i).y, listaPosPerfil.get(i).z);
  }
  objPerfil.endShape();
  //Muestra la forma
  shape(objPerfil);
}

/*
Recorremos todos los vertices y calcularemos desde 0º hasta 360º
*/
void drawSolidoRevolucion(){
  objSolido=createShape();
  objSolido.beginShape(TRIANGLE_STRIP);
  for(int j = 0; j < 360; j+=10){
    if(j%20 == 0){
    for(int i = 0; i < objPerfil.getVertexCount(); i++){
      PVector puntoSolido = rotacionPoints(objPerfil.getVertex(i), radians(j));
      PVector nextPuntoSolido = rotacionPoints(objPerfil.getVertex(i),radians(j+10));
      objSolido.vertex(puntoSolido.x, puntoSolido.y, puntoSolido.z);
      objSolido.vertex(nextPuntoSolido.x,  nextPuntoSolido.y,  nextPuntoSolido.z);
      
    } 
    }else{
      for(int i = objPerfil.getVertexCount()-1; i >= 0; i--){
        PVector puntoSolido = rotacionPoints(objPerfil.getVertex(i), radians(j));
        PVector nextPuntoSolido = rotacionPoints(objPerfil.getVertex(i),radians(j+10));
        objSolido.vertex(nextPuntoSolido.x,  nextPuntoSolido.y,  nextPuntoSolido.z);
        objSolido.vertex(puntoSolido.x, puntoSolido.y, puntoSolido.z);
      }
    }
    
  }
  objSolido.endShape(CLOSE);
}

//Método que calcula la rotación de los puntos 3D
PVector rotacionPoints(PVector puntos, float angulo){
  PVector rotaCoordenadas = new PVector();
  rotaCoordenadas.x = puntos.x * cos(angulo) - puntos.z * sin(angulo);
  rotaCoordenadas.y = puntos.y;
  rotaCoordenadas.z = puntos.x * sin(angulo) + puntos.z * cos(angulo);
  return rotaCoordenadas;
}
