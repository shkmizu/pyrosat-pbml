// ============================================================
// PyroSat - Garra de Captura em Microgravidade
// Disciplina: PBML - Global Solution 2026 - FIAP
// Software: OpenSCAD (modelagem parametrica com variaveis)
//
// Contexto espacial:
// Mecanismo de Docking & Retrieval para nanossatelites PyroSat.
// A garra captura e trava componentes em ambiente de microgravidade
// onde forcas minimas podem deslocar objetos.
// ============================================================

// ── VARIAVEIS PARAMETRICAS ───────────────────────────────────
// Altere estes valores para ajustar toda a peca proporcionalmente

// Corpo principal
largura_corpo     = 50;   // mm - largura total da garra
profundidade_corpo = 20;  // mm - profundidade do corpo
altura_corpo      = 8;    // mm - espessura do corpo base

// Dedos da garra
comprimento_dedo  = 35;   // mm - comprimento de cada dedo
largura_dedo      = 8;    // mm - largura de cada dedo
altura_dedo       = 6;    // mm - espessura dos dedos
abertura_dedo     = 18;   // mm - espaco entre os dedos (onde captura)
curvatura_ponta   = 4;    // mm - raio de curvatura da ponta

// Encaixe servo 9g (dimensoes padrao do mercado)
servo_largura     = 23;   // mm - largura do corpo do servo
servo_profundidade = 12;  // mm - profundidade do corpo do servo
servo_altura      = 10;   // mm - profundidade do encaixe

// Furos de parafuso
raio_furo         = 1.5;  // mm - raio dos furos M3

// MODULO: CORPO PRINCIPAL ──────────────────────────────────
module corpo_principal() {
    difference() {
        // Bloco base
        cube([largura_corpo, profundidade_corpo, altura_corpo]);

        // Encaixe para o servo de 9g (centralizado)
        translate([(largura_corpo - servo_largura) / 2,
                   (profundidade_corpo - servo_profundidade) / 2,
                   -1])
            cube([servo_largura, servo_profundidade, servo_altura + 1]);

        // Furo de parafuso esquerdo
        translate([6, profundidade_corpo / 2, -1])
            cylinder(h = altura_corpo + 2, r = raio_furo, $fn = 16);

        // Furo de parafuso direito
        translate([largura_corpo - 6, profundidade_corpo / 2, -1])
            cylinder(h = altura_corpo + 2, r = raio_furo, $fn = 16);
    }
}

// MODULO: DEDO DA GARRA ────────────────────────────────────
module dedo(espelhado = false) {
    espelho = espelhado ? -1 : 1;

    translate([espelhado ? largura_corpo : 0, 0, 0])
    scale([espelho, 1, 1])
    union() {
        // Haste principal do dedo
        cube([largura_dedo, comprimento_dedo, altura_dedo]);

        // Ponta curva (gancho de captura - importante para microgravidade)
        translate([largura_dedo / 2,
                   comprimento_dedo - curvatura_ponta,
                   altura_dedo / 2])
            rotate([0, 90, 0])
            rotate_extrude(angle = 90, $fn = 32)
            translate([curvatura_ponta, 0, 0])
            circle(r = altura_dedo / 2, $fn = 16);
    }
}

// MODULO: SUPORTE CENTRAL ──────────────────────────────────
module suporte_central() {
    translate([(largura_corpo - abertura_dedo) / 2 - largura_dedo,
               profundidade_corpo,
               0])
        cube([largura_dedo, 8, altura_dedo]);

    translate([(largura_corpo + abertura_dedo) / 2,
               profundidade_corpo,
               0])
        cube([largura_dedo, 8, altura_dedo]);
}

// MONTAGEM FINAL ───────────────────────────────────────────
module garra_pyrosat() {
    union() {
        // Corpo principal com encaixe do servo
        corpo_principal();

        // Dedo esquerdo
        translate([(largura_corpo - abertura_dedo) / 2 - largura_dedo,
                   profundidade_corpo + 8,
                   0])
            dedo(espelhado = false);

        // Dedo direito (espelhado)
        translate([(largura_corpo + abertura_dedo) / 2,
                   profundidade_corpo + 8,
                   0])
            dedo(espelhado = false);

        // Suportes de conexao
        suporte_central();
    }
}

// RENDERIZAR ───────────────────────────────────────────────
garra_pyrosat();