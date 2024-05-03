`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2024 19:10:47
// Design Name: 
// Module Name: clck_psc
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

module clck_psc(

    input logic CLK100MHZ,
    output logic LED0

    );
    
    
    logic [31:0]myreg;
    
    always @(posedge CLK100MHZ)
        myreg +=1;
       
    assign LED0 = myreg[26];
    
endmodule
