`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2025 18:32:03
// Design Name: 
// Module Name: modified_cyclic_lamp
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


module modified_cyclic_lamp(clk, light);
    input clk;
    output reg [0:2] light;

    parameter s0 = 0, s1 = 1, s2 = 2;
    parameter RED   = 3'b000,
              GREEN = 3'b001,
              YELLOW = 3'b010;

    reg [0:1] state;

    always @(posedge clk)
    case (state)
        s0: state <= s1;
        s1: state <= s2;
        s2: state <= s0;
        default: state <= s0;
    endcase

    always @(state)
    case (state)
        s0: light = RED;
        s1: light = GREEN;
        s2: light = YELLOW;
        default: light = RED;
    endcase
endmodule
