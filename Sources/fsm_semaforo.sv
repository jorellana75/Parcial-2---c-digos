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

    input logic clk,        //Se�al para el reloj
    input logic reset,      //Reset
    input logic TA,TB,E,    //Entradas a usar, en este caso TA, TB , y la especial E
    
    //Se definen las salidas para las luces de los sem�foros de la Avenida (posici�n 0) y el Boulevard (posici�n 1)
    output logic [1:0] verde,
    output logic [1:0] amarillo,
    output logic [1:0] rojo

    );
    
    
    //Esta funci�n se utiliza para poder definir los estados correspondientes a los bits que los representan a cada uno, seg�n la tabla de los estados
    typedef enum logic [2:0]{
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11
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
    
    //Se indicar�n cuales ser�n los valores para estado siguiente seg�n el valor de las entradas
    always_comb
    begin
        case(estado_actual)
            S0: begin
                if(TA) estado_siguiente = S0; 
                if(~TA) estado_siguiente = S1;                          //Si TA es 1, entonces se quedar� en estado S0, pero si es 0 o negada, pasar� a S1
                if(E) estado_siguiente = S0;
            end
            
            S1: begin
                estado_siguiente = S2;                                          //El estado siguiente a estar en S1 ser� S2
                if(E) estado_siguiente = S0;                                    //Si a entrada E es 1, entonces regresar� al estado S0
            end
            
            S2: begin
                if(TB) estado_siguiente = S2; 
                if(~TB) estado_siguiente = S3;                          //Si TB es 0, entonces pasar� al estado S3, de lo contrario se quedar� en S2
                if(E) estado_siguiente = S0;                                     //Si la entrada E es 1, entonces regresar� al estado S0
            end
            
            S3: begin
             //El estado siguiente al estar en S3 es S0
                if(E) estado_siguiente = S1;
                if(~E) estado_siguiente = S0;               //Si la entrada E es 1, entonces regresar� al estado S1. Esta parte es la agregada al sistema
                                                            //Si no se recibe se�al en E, entonces seguir� el camino normal, que ser�a regresar a S0
            end
            
            default: estado_siguiente = S0;
         endcase
      end
      
      assign verde[0] = (estado_actual == S0);                              //Verde Avenida
      assign verde[1] = (estado_actual == S2);                              //Verde Boulebard
      assign amarillo[0]= (estado_actual == S1);                            //Amarillo Avenida
      assign amarillo[1] = (estado_actual == S3);                           //Amarillo Boulevard
      assign rojo[0] = (estado_actual == S3) || (estado_actual == S2);      //Rojo Avenida
      assign rojo[1]= (estado_actual == S0) || (estado_actual == S1);       //Rojo Boulevard
  
    
endmodule