`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 19:28:10
// Design Name: 
// Module Name: top_fsm_semaforo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_fsm_semaforo(

    input logic CLK100MHZ,
    input logic [2:0]sw,
    output logic [6:0]LED

    );
    
    logic internal_psc_clock;
    
    // Instanciaci�n del m�dulo de generaci�n de reloj (clck_psc)
    clck_psc my_clck (
        (CLK100MHZ),
        (internal_psc_clock)
    );

    // Instanciaci�n del m�dulo fsm_semaforo
    fsm_semaforo FSM(
        .clk(internal_psc_clock), 
        .TA(sw[0]), 
        .TB(sw[1]), 
        .E(sw[2]), 
        .verde({LED[3], LED[0]}), 
        .amarillo({LED[4], LED[1]}), 
        .rojo({LED[5], LED[2]})
    );

    // Asignaci�n para conectar el reloj interno a un LED
    assign LED[6] = internal_psc_clock;
    
endmodule
