/*
  --------------------------------------------------------------------
 
 UNIVERSIDAD TÉCNICA DEL NORTE
 FICA - CITEL
 
 Tema: Tablero de control de Baloncesto
 
 Integrantes:
 --> Arellano Milena
 --> Donoso Fabricio
 --> Muñoz Pablo
 --> Nupan German
 --> Quelal Rony
 
 --------------------------------------------------------------------
 */

int contador1=0;    // puntos local
int contador2=0;    // puntos visitante
int contf1=0;       // contador de faltas local
int contf2=0;       // contador de faltas visitante
int segundos=0;     // Contador Segundos
int timem1=8;       // Tiempo de media cancha
int minutos=10;     
int periodo=1;
int tm=2, tm2=3, tm3=2, tm4=3;
boolean run=true, run1=true;

PImage img, img2, img3;
PFont fuente, nums, ft;

import processing.serial.*;
Serial puerto;
char comando;

void setup () {
  surface.setTitle("ProyectoFinal_SE");
  puerto = new Serial(this, "COM6", 9600);
  size(1280, 720);
  background(#264C59);

  fuente = loadFont("Swiss721BT-BoldCondensedItalic-48.vlw");
  ft = loadFont("Swiss721BT-BoldCondensedItalic-30.vlw");
  nums = loadFont("SevenSegmentRegular-100.vlw");
}

void draw() {
  interfaz();
  local();
  visitante();
  faltas();
  timepocancha();
  tiempomuerto();
  botones();
}

void reloj() {
  textSize(100);
  delay(1000);

  if (segundos>=0) {
    fill(#FFA600);
    textFont(nums);
    text(nf(minutos, 2)+":"+nf(segundos, 2), 551, 200);
    segundos--;
  } else if (minutos>0 && segundos==-1) {
    minutos--;
    segundos=59;
    fill(#FFA600);
    textFont(nums);
    text(nf(minutos, 2)+":"+nf(segundos, 2), 551, 200);
  } else {
    minutos=0;
    segundos=0;
    fill(255, 0, 0);
    textFont(nums);
    text(nf(minutos, 2)+":"+nf(segundos, 2), 551, 200);
  }
  periodo();
}

void periodo() {
  if (periodo<5) {
    fill(#CCFF00);
    textSize(50);
    textFont(nums);
    text(periodo, 760, 350);
  } else {
    fill(#CCFF00);
    textSize(50);
    textFont(nums);
    text('E', 760, 350);
  }
}


void local() {
  if (run) {
    //background(255, 255, 255);
    //fill(255, 255, 255);
    //rect(480, 180, 100, 100);
    fill(#CCFF00);
    textSize(50);
    if (contador1>0) {
      textFont(nums);
      text(nf(contador1, 3), 153, 253);
    } else {
      contador1=0;
      textFont(nums);
      text(nf(contador1, 3), 153, 253);
    }
    reloj();
  }
}

void visitante() {
  if (run) {
    fill(#CCFF00);
    textSize(50);
    if (contador2>0) {
      textFont(nums);
      text(nf(contador2, 3), 990, 253);
    } else {
      contador2=0;
      textFont(nums);
      text(nf(contador2, 3), 990, 253);
    }
  }
}

void timepocancha() {
  if (run) {
    //textSize(50);
    //delay(1000);

    if (timem1>=0) {
      fill(#CCFF00);
      textFont(nums);
      text(nf(timem1, 2), 731, 461);     //tiempo 8 seg
      timem1--;
    } else if (timem1==-1) {
      //delay(500);
      timem1=0;
      //timem1--;
      fill(255, 0, 0);
      textFont(nums);
      text(nf(timem1, 2), 731, 461);     //timepo 24 seg
    }
    if (timem1==24) {
      timem1--;
      fill(#CCFF00);
      textFont(nums);
      text(nf(timem1, 2), 731, 461);     //timepo 24 seg
    }
  }
}

void tiempomuerto() {
  if (run) {
    //delay(1000);
    fill(#CCFF00);
    textFont(nums);
    text(nf(tm, 2), 480, 635);     //timepo 24 seg
    fill(#CCFF00);
    textFont(nums);
    text(nf(tm3, 2), 725, 635);     //timepo 24 seg

    if (periodo==3 || periodo==4 ) {
      fill(#06282F);
      strokeWeight(5);
      stroke(#FFFFFF);
      rect(450, 550, 150, 100);
      fill(#CCFF00);
      textFont(nums);
      text(nf(tm2, 2), 480, 635);     //timepo 24 seg
      if (tm2==0) {
        tm2=0;
        fill(255, 0, 0);
        textFont(nums);
        text(nf(tm2, 2), 480, 635);     //tiempo muerto
      }
    }
    if (tm==0) {
      tm=0;
      fill(255, 0, 0);
      textFont(nums);
      text(nf(tm, 2), 480, 635);     //tiempo muerto
    }

    if (periodo==3 || periodo==4 ) {
      fill(#06282F);
      strokeWeight(5);
      stroke(#FFFFFF);
      rect(700, 550, 150, 100);
      fill(#CCFF00);
      textFont(nums);
      text(nf(tm4, 2), 725, 635);     //timepo 24 seg
      if (tm4==0) {
        tm4=0;
        fill(255, 0, 0);
        textFont(nums);
        text(nf(tm4, 2), 725, 635);     //tiempo muerto
      }
    }
    if (tm3==0) {
      tm3=0;
      fill(255, 0, 0);
      textFont(nums);
      text(nf(tm3, 2), 725, 635);     //tiempo muerto
    }
  }
}



void faltas() {
  if (run) {
    textSize(100);
    //delay(500);
    fill(#CCFF00);
    textFont(nums);
    text(nf(contf1, 2), 175, 635);     //faltas local
    fill(#CCFF00);
    textFont(nums);
    text(nf(contf2, 2), 1025, 635);    //faltas visitante

    if (contf1>=5) {
      img = loadImage ("bandera.png");
      image(img, 153, 312, 40, 45);
    }
    if (contf2>=5) {
      img2 = loadImage ("bandera.png");
      image(img2, 1105, 312, 40, 45);
    }
  }
}

/*
void keyPressed() {
  switch(key) {
    //CONTADOR PUNTOS LOCAL
  case  'q':  //Contar +1
    contador1++;
    break;
  case  'Q':  //Contar -1
    contador1--;
    break;
  case  'w':  //Contar +2
    contador1=contador1+2;
    break;
  case  'W':  //Contar -2
    contador1=contador1-2;
    break;
  case 'e' : //Contar +3
    contador1=contador1+3;
    println(key);
    break;
  case  'E':  //Contar -3
    contador1=contador1-3;
    println(key);
    break;

    //CONTADOR PUNTOS VISITANTE
  case  'a':  //Contar +1
    contador2++;
    break;
  case  'A':  //Contar -1
    contador2--;
    break;
  case  's':  //Contar +2
    contador2=contador2+2;
    break;
  case  'S':  //Contar -2
    contador2=contador2-2;
    break;
  case 'd' : //Contar +3
    contador2=contador2+3;
    println(key);
    break;
  case  'D':  //Contar -3
    contador2=contador2-3;
    println(key);
    break;
  case 'p':  //Pausa
    run = !run;
    break;
  case 't':  //Periodo +1
    minutos=10;
    segundos=00;
    contf1=0;
    contf2=0;
    if (periodo<4) {
      periodo++;
    }
    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(130, 300, 80, 70);
    break;
  case 'T':  //Periodo -1
    minutos=10;
    segundos=00;
    contf1=0;
    contf2=0;
    if (periodo>1) {
      periodo--;
    }
    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(130, 300, 80, 70);
    break;
  case 'f':  //Contar +1 faltas Local
    contf1++;
    break;
  case 'F':  //Contar -1 faltas Local
    contf1--;
    if (contf1==-1) {
      contf1=0;
    }
    break;
  case 'g':  //Contar +1 faltas Visitante
    contf2++;
    break;
  case 'G':  //Contar -1 faltas Visitante
    contf2--;
    if (contf2==-1) {
      contf2=0;
    }
    break;
  case 'j':    //Tiempo = 24 segundos media cancha
    timem1=24;
    break;
  case 'k':    //Tiempo = 8 segundos media cancha
    timem1=8;
    break;
  case 'u':    //Tiempo muerto Local +1
    if (periodo==1 || periodo ==2) {
      if (tm<2) {
        tm++;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm2<3) {
        tm2++;
      }
    }
    break;
  case 'U': //Tiempo muerto Local -1
    if (periodo==1 || periodo ==2) {
      if (tm>0) {
        tm--;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm2>0) {
        tm2--;
      }
    }
    break;
  case 'i':  //Tiempo muerto Visitante +1
    if (periodo==1 || periodo ==2) {
      if (tm3<2) {
        tm3++;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm4<3) {
        tm4++;
      }
    }
    break;
  case 'I':  //Tiempo muerto Visitante -1
    if (periodo==1 || periodo ==2) {
      if (tm3>0) {
        tm3--;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm4>0) {
        tm4--;
      }
    }
    break;
  case 'R':  // Periodo -1
    minutos=00;
    segundos=00;
    contf1=0;
    contf2=0;
    periodo=0;
    //tm=0;
    //tm3=0;
    timem1=0;
    contador1=0;
    contador2=0;
    break;  
  }
}*/

void interfaz() {
  //MARCO
  if (run) {

    fill(#264C59);
    strokeWeight(10);
    stroke(#FFFFFF);
    rect(19, 17, 1243, 688);
    img3 = loadImage ("fondo.png");
    image(img3, 0, 0, 1280, 720);
    // LOCAL
    //FUENTE
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(50);
    text("LOCAL", 160, 130);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(110, 160, 230, 120);

    //BONUS LOCAL
    textFont(ft);
    fill(255, 255, 255);
    //textSize(35);
    text("BANDERA", 230, 350);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(130, 300, 80, 70);

    //FOUL LOCAL
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(35);
    text("FALTAS", 160, 530);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(150, 550, 150, 100);

    //TIEMPO
    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(450, 90, 400, 150);

    // PERIODO
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(50);
    text("PERIODO", 535, 340);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(730, 270, 100, 90);

    // TIEMPO DE MEDIA CANCHA
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(50);
    text("TIMER", 585, 433);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(725, 380, 110, 90);

    //TIEMPOS FUERA
    textFont(ft);
    fill(255, 255, 255);
    //textSize(50);
    text("TIEMPOS MUERTOS RESTANTES", 455, 520);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(450, 550, 150, 100);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(700, 550, 150, 100);

    // VISITANTE
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(50);
    text("VISITANTE", 965, 130);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(950, 160, 230, 120);

    //BONUS VISITANTE
    textFont(ft);
    fill(255, 255, 255);
    //textSize(10);
    text("BANDERA", 950, 350);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(1080, 300, 80, 70);

    //FOUL VISITANTE
    textFont(fuente);
    fill(255, 255, 255);
    //textSize(35);
    text("FALTAS", 1010, 530);

    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(1000, 550, 150, 100);
  }
}

void botones(){
  if (puerto.available()>0) {
    comando = puerto.readChar();
    println(comando);
    switch(comando) {
    //CONTADOR PUNTOS LOCAL
  case  'q':  //Contar +1
    contador1++;
    break;
  case  'Q':  //Contar -1
    contador1--;
    break;
  case  'w':  //Contar +2
    contador1=contador1+2;
    break;
  case  'W':  //Contar -2
    contador1=contador1-2;
    break;
  case 'e' : //Contar +3
    contador1=contador1+3;
    println(key);
    break;
  case  'E':  //Contar -3
    contador1=contador1-3;
    println(key);
    break;

    //CONTADOR PUNTOS VISITANTE
  case  'a':  //Contar +1
    contador2++;
    break;
  case  'A':  //Contar -1
    contador2--;
    break;
  case  's':  //Contar +2
    contador2=contador2+2;
    break;
  case  'S':  //Contar -2
    contador2=contador2-2;
    break;
  case 'd' : //Contar +3
    contador2=contador2+3;
    println(key);
    break;
  case  'D':  //Contar -3
    contador2=contador2-3;
    println(key);
    break;
  case 'p':  //Pausa
    run = !run;
    break;
  case 't':  //Periodo +1
    minutos=10;
    segundos=00;
    contf1=0;
    contf2=0;
    if (periodo<4) {
      periodo++;
    }
    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(130, 300, 80, 70);
    break;
  case 'T':  //Periodo -1
    minutos=10;
    segundos=00;
    contf1=0;
    contf2=0;
    if (periodo>1) {
      periodo--;
    }
    fill(#06282F);
    strokeWeight(5);
    stroke(#FFFFFF);
    rect(130, 300, 80, 70);
    break;
  case 'f':  //Contar +1 faltas Local
    contf1++;
    break;
  case 'F':  //Contar -1 faltas Local
    contf1--;
    if (contf1==-1) {
      contf1=0;
    }
    break;
  case 'g':  //Contar +1 faltas Visitante
    contf2++;
    break;
  case 'G':  //Contar -1 faltas Visitante
    contf2--;
    if (contf2==-1) {
      contf2=0;
    }
    break;
  case 'j':    //Tiempo = 24 segundos media cancha
    timem1=24;
    break;
  case 'k':    //Tiempo = 8 segundos media cancha
    timem1=8;
    break;
  case 'u':    //Tiempo muerto Local +1
    if (periodo==1 || periodo ==2) {
      if (tm<2) {
        tm++;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm2<3) {
        tm2++;
      }
    }
    break;
  case 'U': //Tiempo muerto Local -1
    if (periodo==1 || periodo ==2) {
      if (tm>0) {
        tm--;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm2>0) {
        tm2--;
      }
    }
    break;
  case 'i':  //Tiempo muerto Visitante +1
    if (periodo==1 || periodo ==2) {
      if (tm3<2) {
        tm3++;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm4<3) {
        tm4++;
      }
    }
    break;
  case 'I':  //Tiempo muerto Visitante -1
    if (periodo==1 || periodo ==2) {
      if (tm3>0) {
        tm3--;
      }
    }
    if (periodo==3 || periodo ==4 ) {
      if (tm4>0) {
        tm4--;
      }
    }
    break;
  case 'R':  // Periodo -1
    minutos=00;
    segundos=00;
    contf1=0;
    contf2=0;
    periodo=0;
    //tm=0;
    //tm3=0;
    timem1=0;
    contador1=0;
    contador2=0;
    break;  
  }
    
  }
}
