`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 18:27:28
// Design Name: 
// Module Name: fsm_semaforo
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


module fsm_semaforo(

    input logic clk,        //Señal para el reloj
    input logic reset,      //Reset
    input logic TA,TB,E,R,    //Entradas a usar, en este caso TA, TB , la de emergencia y la adicional R
    
    //Se definen las salidas para las luces de los semáforos de la Avenida (posición 0) y el Boulevard (posición 1)
    output logic [1:0] verde,
    output logic [1:0] amarillo,
    output logic [1:0] rojo

    );
    
    
    //Esta función se utiliza para poder definir los estados correspondientes a los bits que los representan a cada uno, según la tabla de los estados
    typedef enum logic [2:0]{
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
        } estado;
        
        //Las variables de estado actual y de estado siguiente pueden tomar los valores de la variable 'estado'
        estado estado_actual, estado_siguiente;
    
    //Se define el reloj con el flip-flop
    always_ff @(posedge clk, posedge reset)
        begin
            if(reset) 
                estado_actual <= S0;
            else
                estado_actual <= estado_siguiente;
        end
    
    //Se indicarán cuales serán los valores para estado siguiente según el valor de las entradas
    always_comb
    begin
        case(estado_actual)
            S0: begin
                if(TA) estado_siguiente = S0; 
                if(~TA) estado_siguiente = S1;                          //Si TA es 1, entonces se quedará en estado S0, pero si es 0 o negada, pasará a S1
                if(E) estado_siguiente = S0;
                if(R) estado_siguiente = S4;                            //Si se presiona R, pasará al estado S4
            end
            
            S1: begin
                estado_siguiente = S2;                                          //El estado siguiente a estar en S1 será S2
                if(E) estado_siguiente = S0;                                    //Si a entrada E es 1, entonces regresará al estado S0
                if(R) estado_siguiente = S4;                                    //Si se presiona R, pasará al estado S4
            end
            
            S2: begin
                if(TB) estado_siguiente = S2; 
                if(~TB) estado_siguiente = S3;                          //Si TB es 0, entonces pasará al estado S3, de lo contrario se quedará en S2
                if(E) estado_siguiente = S0;                                     //Si la entrada E es 1, entonces regresará al estado S0
                if(R) estado_siguiente = S4;                            //Si se presiona R, pasará al estado S4
            end
            
            S3: begin
             //El estado siguiente al estar en S3 es S0
                if(E) estado_siguiente = S1;
                if(~E) estado_siguiente = S0;               //Si la entrada E es 1, entonces regresará al estado S1. Esta parte es la agregada al sistema
                                                            //Si no se recibe señal en E, entonces seguirá el camino normal, que sería regresar a S0
                if(R) estado_siguiente = S4;                //Si se presiona R, pasará al estado S4
                //if(~R) estado_siguiente = S0;                                            
            end
            
            S4: begin
                
                if(R) estado_siguiente = S4;                //Se le agregó este nuevo estado, en donde si se presiona R, pasará al estado S4
                if(~R) estado_siguiente = S0;                   //el cual pone en rojo la avenida y el Boulevard

            
            end
            
            default: estado_siguiente = S0;
         endcase
      end
      
      assign verde[0] = (estado_actual == S0);                                                      //Verde Avenida
      assign verde[1] = (estado_actual == S2);                                                      //Verde Boulebard
      assign amarillo[0]= (estado_actual == S1);                                                    //Amarillo Avenida
      assign amarillo[1] = (estado_actual == S3);                                                   //Amarillo Boulevard
      assign rojo[0] = (estado_actual == S3) || (estado_actual == S2) || (estado_actual == S4);     //Rojo Avenida
      assign rojo[1]= (estado_actual == S0) || (estado_actual == S1) || (estado_actual == S4);      //Rojo Boulevard
  
    
endmodule
