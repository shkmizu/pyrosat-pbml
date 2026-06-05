# pyrosat-pbml
# PyroSat - Braço Robótico de Posicionamento de Sensor Térmico

**Disciplina:** Project-Based Maker Lab (PBML)  
**Global Solution 2026 - FIAP - Engenharia de Software - 4 Ano**

## Integrantes

| RM | Nome |
|---|---|
| RM98827 | Andre Soler |
| RM551869 | Fabrizio Maia |
| RM96869 | Rodrigo Paixao |
| RM551684 | Victor Asfur |
| RM550390 | Vitor Shimizu |

## Contexto do Projeto

O PyroSat é uma plataforma de alerta precoce de queimadas que usa dados satelitais da NASA para monitorar o território brasileiro. Este protótipo simula o mecanismo de reposicionamento do sensor infravermelho VIIRS de um nanossatélite da constelação PyroSat.

O servo vertical (comandos U e D) simula a inclinação do sensor em relação ao solo. O servo horizontal (comandos O e C) simula o mecanismo de travamento de posição do scanner. O LED de status indica quando o sistema está em operação.

## Acesso ao Simulador

Link público do circuito no Tinkercad:  
https://www.tinkercad.com/things/hUp4KhdnFGA

## Circuito

**Componentes:**
- 1x Arduino Uno R3
- 2x Micro Servo 9g
- 1x LED
- 1x Resistor 220 ohms


## Modelagem 3D

**Software utilizado:** OpenSCAD

A garra foi modelada com variaveis parametricas que permitem ajustar todas as dimensoes da peca alterando apenas os valores no inicio do codigo.

**Variaveis principais:**
- `largura_corpo` - largura total da garra (padrao: 50mm)
- `comprimento_dedo` - comprimento de cada dedo (padrao: 35mm)
- `abertura_dedo` - espaco de captura entre os dedos (padrao: 18mm)
- `servo_largura` / `servo_profundidade` - encaixe do servo 9g (23mm x 12mm)

**Detalhes do design:**
- Corpo base com encaixe preciso para servo de 9g
- Dois dedos com ganchos curvos para captura em microgravidade
- Furos M3 para fixacao mecanica
- Design autoral baseado em garras de captura de satelites reais

### Imagens do Modelo 3D

![Frente](images/modelo_3d_frente.png)
![Perspectiva](images/modelo_3d_perspectiva.png)
