#include <Servo.h>

Servo servoVertical;
Servo servoHorizontal;

const int PINO_SERVO_V = 9;
const int PINO_SERVO_H = 10;
const int PINO_LED     = 13;

const int POS_CIMA    = 135;
const int POS_BAIXO   = 45;
const int POS_ABERTO  = 90;
const int POS_FECHADO = 0;
const int POS_NEUTRO  = 90;

void setup() {
  Serial.begin(9600);
  servoVertical.attach(PINO_SERVO_V);
  servoHorizontal.attach(PINO_SERVO_H);
  pinMode(PINO_LED, OUTPUT);
  servoVertical.write(POS_NEUTRO);
  servoHorizontal.write(POS_NEUTRO);
  digitalWrite(PINO_LED, LOW);

  Serial.println("========================================");
  Serial.println("  PyroSat - Scanner Termico v1.0");
  Serial.println("  Sistema de Monitoramento de Queimadas");
  Serial.println("========================================");
  Serial.println("Comandos: U D O C S H");
  Serial.println("Aguardando comando...");

  for (int i = 0; i < 3; i++) {
    digitalWrite(PINO_LED, HIGH);
    delay(200);
    digitalWrite(PINO_LED, LOW);
    delay(200);
  }
}

void loop() {
  if (Serial.available() > 0) {
    char cmd = Serial.read();
    digitalWrite(PINO_LED, HIGH);

    switch (cmd) {
      case 'U': case 'u':
        servoVertical.write(POS_CIMA);
        Serial.println("[UP] Sensor inclinado para zona norte - 135 graus");
        break;
      case 'D': case 'd':
        servoVertical.write(POS_BAIXO);
        Serial.println("[DOWN] Sensor inclinado para zona sul - 45 graus");
        break;
      case 'O': case 'o':
        servoHorizontal.write(POS_ABERTO);
        Serial.println("[OPEN] Travamento liberado - 90 graus");
        break;
      case 'C': case 'c':
        servoHorizontal.write(POS_FECHADO);
        Serial.println("[CLOSE] Posicao travada - 0 graus");
        break;
      case 'S': case 's':
        executarScan();
        break;
      case 'H': case 'h':
        servoVertical.write(POS_NEUTRO);
        servoHorizontal.write(POS_NEUTRO);
        Serial.println("[HOME] Posicao neutra restaurada");
        break;
      case '\n': case '\r': case ' ':
        digitalWrite(PINO_LED, LOW);
        return;
      default:
        Serial.println("[ERRO] Comando invalido. Use: U D O C S H");
        digitalWrite(PINO_LED, LOW);
        return;
    }

    delay(400);
    digitalWrite(PINO_LED, LOW);
  }
}

void executarScan() {
  Serial.println("[SCAN] Iniciando varredura automatica...");
  int posicoes[] = {0, 30, 60, 90, 120, 150, 180};

  for (int i = 0; i < 7; i++) {
    servoHorizontal.write(posicoes[i]);
    digitalWrite(PINO_LED, HIGH);
    delay(150);
    digitalWrite(PINO_LED, LOW);
    delay(150);
    Serial.print("  Posicao ");
    Serial.print(i + 1);
    Serial.print("/7 - Azimute: ");
    Serial.print(posicoes[i]);
    Serial.println(" graus");
    delay(300);
  }

  servoHorizontal.write(POS_NEUTRO);
  Serial.println("[SCAN] Varredura concluida");

  for (int i = 0; i < 2; i++) {
    digitalWrite(PINO_LED, HIGH);
    delay(300);
    digitalWrite(PINO_LED, LOW);
    delay(300);
  }
}
