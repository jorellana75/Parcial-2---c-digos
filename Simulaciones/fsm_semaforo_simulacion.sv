`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 17:37:32
// Design Name: 
// Module Name: fsm_semaforo_simulacion
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


module fsm_semaforo_simulacion;

    logic clk;
    logic reset;
    logic TA;
    logic TB;
    logic E;

    logic [1:0] verde;
    logic [1:0] amarillo;
    logic [1:0] rojo;

    //Instanciaci�n para nuestro c�digo principal
    fsm_semaforo dut(
        .clk(clk),
        .reset(reset),
        .TA(TA),
        .TB(TB),
        .E(E),
        
        .verde({verde[1], verde[0]}), 
        .amarillo({amarillo[1], amarillo[0]}), 
        .rojo({rojo[1], rojo[0]})
    );

    initial begin
        reset <= 1; #30;                                //Inicializa el reset en 1
        #30;                                            //espera 30 unidades de tiempo para cambiar de valor a las establecidas a continuaci�n
        reset <= 0; TA <= 1; TB <= 0; E <= 0; #30;
        reset <= 0; TA <= 0; TB <= 1; E <= 0; #30;
        reset <= 0; TA <= 1; TB <= 0; E <= 0; #30;
        reset <= 0; TA <= 0; TB <= 1; E <= 0; #30;
        reset <= 0; TA <= 0; TB <= 0; E <= 1; #30;
        reset <= 0; TA <= 0; TB <= 1; E <= 0; #30;
        reset <= 0; TA <= 1; TB <= 0; E <= 0; #30;

    end

    always begin
        clk <= 1; #10;              //Define el bucle siempre activo que controla la se�al del reloj
        clk <= 0; #10;
    end



endmodule
