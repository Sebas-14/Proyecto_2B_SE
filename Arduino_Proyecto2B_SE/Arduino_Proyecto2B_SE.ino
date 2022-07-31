
void setup() {
  pinMode(22, INPUT);
  pinMode(23, INPUT);
  pinMode(24, INPUT);
  pinMode(25, INPUT);
  
  pinMode(26, INPUT);
  pinMode(27, INPUT);
  pinMode(28, INPUT);
  pinMode(29, INPUT);
  pinMode(30, INPUT);

  pinMode(31, INPUT);
  pinMode(32, INPUT);
  pinMode(33, INPUT);
  pinMode(34, INPUT);
  pinMode(35, INPUT);

  pinMode(36, INPUT);
  pinMode(37, INPUT);
  pinMode(38, INPUT);
  pinMode(39, INPUT);
  pinMode(40, INPUT);

  pinMode(41, INPUT);
  pinMode(42, INPUT);
  pinMode(43, INPUT);
  pinMode(44, INPUT);
  pinMode(45, INPUT);

  pinMode(46, INPUT);
  pinMode(47, INPUT);
  Serial.begin(9600);
}

void loop() {
  //CONTADOR PUNTOS LOCAL
  if (digitalRead(23) == 0) {
    Serial.print('e');        //Contar +3
  }
  if (digitalRead(24) == 0) {
    Serial.print('E');        //Contar -3
  }
  if (digitalRead(25) == 0) {
    Serial.print('w');        //Contar +2
  }
  if (digitalRead(27) == 0) {
    Serial.print('W');        //Contar -2
  }
  if (digitalRead(28) == 0) {
    Serial.print('q');        //Contar +1
  }
  if (digitalRead(29) == 0) {
    Serial.print('Q');        //Contar -1
  }
  //CONTADOR PUNTOS VISITANTE
  if (digitalRead(44) == 0) {
    Serial.print('a');        //Contar +1
  }
  if (digitalRead(45) == 0) {
    Serial.print('A');        //Contar -1
  }
  if (digitalRead(42) == 0) {
    Serial.print('s');        //Contar +2
  }
  if (digitalRead(43) == 0) {
    Serial.print('S');        //Contar -2
  }
  if (digitalRead(40) == 0) {
    Serial.print('d');        //Contar +3
  }
  if (digitalRead(41) == 0) {
    Serial.print('D');        //Contar -3
  }

  if (digitalRead(31) == 0) {
    Serial.print('p');        //Pausa
  }
  if (digitalRead(34) == 0) {
    Serial.print('t');        //Periodo +1
  }
  if (digitalRead(33) == 0) {
    Serial.print('T');        //Periodo -1
  }
  if (digitalRead(22) == 0) {
    Serial.print('f');        //Contar +1 faltas Local
  }
  if (digitalRead(26) == 0) {
    Serial.print('F');        //Contar -1 faltas Local
  }
  if (digitalRead(46) == 0) {
    Serial.print('g');        //Contar +1 faltas Visitante
  }
  if (digitalRead(47) == 0) {
    Serial.print('G');        //Contar -1 faltas Visitante
  }
  if (digitalRead(36) == 0) {
    Serial.print('j');        //Tiempo = 24 segundos media cancha
  }
  if (digitalRead(37) == 0) {
    Serial.print('k');        //Tiempo = 8 segundos media cancha
  }
  if (digitalRead(35) == 0) {
    Serial.print('u');        //Tiempo muerto Local +1
  }
  if (digitalRead(32) == 0) {
    Serial.print('U');        //Tiempo muerto Local -1
  }
  if (digitalRead(38) == 0) {
    Serial.print('i');        //Tiempo muerto Visitante +1
  }
  if (digitalRead(39) == 0) {
    Serial.print('I');        //Tiempo muerto Visitante -1
  }
  if (digitalRead(30) == 0) {
    Serial.print('R');        //Periodo -1
  }
  delay(100);
}
