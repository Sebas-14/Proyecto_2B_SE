/*
            UNIVERSIDAD TECNICA DEL NORTE
        FACULTAD DE INGENIERIA EN CIENCIAS APLICADAS
            CARRERA DE TELECOMUNICACIONES
                SISTEMAS EMBEBIDOS
                    PROYECTO 2B
INTEGRANTRES:
              Arellano Milena
              Donoso Fabricio
              Muñoz Pablo
              Nupan German 
              Quelal Rony
*/
#include <LiquidCrystal_I2C.h>  //Libreria de Display
#include <Keypad.h>         //Libreria para agregar el teclado matricial
const byte ROWS = 4;        //Numero de filas de teclado
const byte COLS = 4;        //Numero de columnas de teclado
char keys[ROWS][COLS] = {   //Inicialización de filas y columnas y creación de teclado
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'},
};

byte rowPins[ROWS] = {10, 9, 8, 7}; //Pines para filas de teclado
byte colPins[COLS] = {13, 12, 11, 6}; //Pines para columnas de teclado

LiquidCrystal_I2C lcd(0x27, 16, 2); //Inicializacion de LCD
Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS); //Orientacion de pines y llamada a la librería

String dato;        //variable de recepción de datos de tipo string
int tam;            // variable para almacenar el tamaño del dato
int i = 0;          // variable de recorrido
String salida;      // mensaje de salida de vocales codificadas
int j = 0;          // variable de confirmación de vocales

String mensaje = "Project Embebido";   //Escriba aqui el texto a mostrar
int longitud_texto = mensaje.length();  //Obtiene y almacena la longitud del texto

void setup() {
  lcd.init();
  lcd.backlight();
  lcd.print(mensaje);    //Muestra el mensaje
  delay(500);
  Serial.begin(9600);   //Comienza la comunicacion serial
  lcd.begin(16, 2);     //Inicia las filas y columnas a emplear de la LCD
  lcd.setCursor(0, 0);  //Posicion inicial en la pantalla
  lcd.print("Nombre Equipo 2"); //Mensaje a imprimir en el Display

}

void loop() {

  if (Serial.available() > 0) {        // Revisa si existen datos a ser leídos
    dato = Serial.readString();
    dato.toLowerCase();               //convierte que todos los datos ingresados sean minúsculas
    tam = dato.length() + 1;         //conocer el tamaño del dato tipo String
    //se crea vector que separará a las vocales ingresadas por comunicación serial
    char vector [tam];
    dato.toCharArray(vector, tam);   // almacena cada caracter en una posición del vector

    Serial.println(j);    // muestra cuantas letras no fueron vocales
    if (j > 0) { // mensaje de error
      Serial.println("Error.!");
    }
    else {
      Serial.println("Validado.!");
      //recorre vector de tipo Char
      for (i = 0; i < tam - 1; i++) {
        //codifica por vocal en cada posición y devuelve variable tipo string
        switch (vector[i]) {
          case '1':
            salida = salida + "Celtics           ";
            break;
          case '2':
            salida = salida + "Raptors          "; //concatena mensaje
            break;
          case '3':
            salida = salida + " Panteras      "; //concatena mensaje
            break;
          case 'A':
            salida = salida + "Matadores      "; //concatena mensaje
            break;
          case '4':
            salida = salida + "hormigas locas     "; //concatena mensaje


          case '5':
            salida = salida + "Gorilas         ";
            break;
          case '6':
            salida = salida + "Aztecas         "; //concatena mensaje
            break;
          case 'B':
            salida = salida + "Saltamontes          "; //concatena mensaje
            break;
          case '7':
            salida = salida + "Pumas          "; //concatena mensaje
            break;
          case '8':
            salida = salida + "Pioneros       "; //concatena mensaje
            break;

          case '9':
            salida = salida + "Guardianes          ";
            break;
          case 'C':
            salida = salida + "Diablos          "; //concatena mensaje
            break;
          case '*':
            salida = salida + "Anitos Fc            "; //concatena mensaje
            break;
          case '0':
            salida = salida + "Republica I. Fc   "; //concatena mensaje
            break;
          case '#':
            salida = salida + "Norteño             "; //concatena mensaje
            break;
          case 'D':
            salida = salida + "Biela             "; //concatena mensaje
            break;
        }
      }
    }
    j = 0;                      //reinicia contador
    Serial.println(salida);     //enviame mensaje de vocales condificadas
    salida = "            ";                //borra los datos almacenados
  }

  char key = keypad.getKey();     //Leemos el valor ingresado por teclado
  if (key) {
    //Codificamos las vocales
    switch (key) {
      case '1':
        lcd.setCursor(0, 1);
        lcd.print("Celtics          ");
        break;
      case '2':
        lcd.setCursor(0, 1);
        lcd.print("Raptors         ");
        break;
      case '3':
        lcd.setCursor(0, 1);
        lcd.print("Panteras         ");
        break;
      case 'A':
        lcd.setCursor(0, 1);
        lcd.print("Matadores       ");
        break;
      case '4':
        lcd.setCursor(0, 1);
        lcd.print("Hormigas locas      ");
        break;

      case '5':
        lcd.setCursor(0, 1);
        lcd.print("Gorilas           ");
        break;
      case '6':
        lcd.setCursor(0, 1);
        lcd.print("Aztecas          ");
        break;
      case 'B':
        lcd.setCursor(0, 1);
        lcd.print("Saltamontes         ");
        break;
      case '7':
        lcd.setCursor(0, 1);
        lcd.print("Pumas            ");
        break;
      case '8':
        lcd.setCursor(0, 1);
        lcd.print("Pioneros         ");
        break;
      case '9':
        lcd.setCursor(0, 1);
        lcd.print("Guardianes          ");
        break;
      case 'C':
        lcd.setCursor(0, 1);
        lcd.print("Diablos          ");
        break;
      case '*':
        lcd.setCursor(0, 1);
        lcd.print("Anitos Fc           ");
        break;
      case '0':
        lcd.setCursor(0, 1);
        lcd.print("Republica I. Fc      ");
        break;
      case '#':
        lcd.setCursor(0, 1);
        lcd.print("Norteño          ");
        break;
      case 'D':
        lcd.setCursor(0, 1);
        lcd.print("Biela          ");
        break;
    }
  }
}
