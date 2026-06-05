## Como Operar o Braço

### 1. Abrir o simulador
Acesse o link do Tinkercad acima e clique em **Start Simulation**.

### 2. Abrir o Monitor Serial
No canto superior direito da tela do Tinkercad, clique no botão **Serial Monitor** (icone de tela pequena).

### 3. Configurar o baud rate
No Monitor Serial, verifique se o baud rate esta configurado para **9600**. Se necessario, ajuste no seletor na parte inferior da janela.

### 4. Digitar os comandos
No campo de texto do Monitor Serial, digite uma letra e pressione **Send** ou **Enter**.

## Tabela de Comandos

| Comando | Acao | Servo | Angulo |
|---|---|---|---|
| `U` | Sensor inclinado para zona norte | Vertical (pino 9) | 135 graus |
| `D` | Sensor inclinado para zona sul | Vertical (pino 9) | 45 graus |
| `O` | Travamento liberado | Horizontal (pino 10) | 90 graus |
| `C` | Posicao travada | Horizontal (pino 10) | 0 graus |
| `S` | Varredura automatica completa | Horizontal (pino 10) | 0 a 180 graus |
| `H` | Retorna a posicao neutra | Ambos | 90 graus |

> O LED no pino 13 acende durante cada movimento e apaga quando o servo para.

## Especificacoes Tecnicas

- Tensao de operacao dos servos: 5V (fornecida pelo Arduino)
- Pino servo vertical: 9 (PWM)
- Pino servo horizontal: 10 (PWM)
- Pino LED: 13
- Baud rate Serial Monitor: 9600

## Estrutura do Repositorio

```
pyrosat-pbml/
├── src/
│   └── pyrosat_arm.ino
├── model/
│   ├── bracopyrosat.scad
│   └── bracopyrosat.stl
├── images/
│   ├── circuito_tinkercad.png
│   └── modelo3d1.png ... modelo3d5.png
└── README.md
```
