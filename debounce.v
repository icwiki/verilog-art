// +FHDR------------------------------------------------------------
//                 Copyright (c) 2019 .
//                       ALL RIGHTS RESERVED
// -----------------------------------------------------------------
// Filename      : debounce.v
// Author        : 
// Created On    : 2019-10-27 16:38
// Last Modified : 
// -----------------------------------------------------------------
// Description:
//
//
// -FHDR------------------------------------------------------------

`ifndef __DEBOUNCE_V__
`define __DEBOUNCE_V__

`timescale 1ns/1ps

module debounce(/*autoarg*/
    //Inputs
    clk, rst_n, signal_i, 

    //Outputs
    signal_o
);

input                                   clk;
input                                   rst_n;

input                                   signal_i;
output                                  signal_o;

parameter BIT_NUM  = 5 ;
reg [BIT_NUM-1 : 0] signal_deb ; //
always @ (posedge clk or negedge rst_n)
begin
    if (rst_n == 1'b0)
     signal_deb <= {BIT_NUM{1'b0}} ;
    else
     signal_deb <=  {signal_deb[BIT_NUM-2:0],signal_i} ;
end

reg                                     signal_o;
always @ (posedge clk or negedge rst_n)
begin
    if (rst_n == 1'b0)
        signal_o <= 1'b1 ;
    else if (signal_deb[BIT_NUM-1:1]=={(BIT_NUM-1){1'b0}})
        signal_o <=  1'b1 ;
    else if (signal_deb[BIT_NUM-1:1]=={(BIT_NUM-1){1'b0}})
        signal_o <=  1'b0 ;
    else 
        signal_o <=  signal_o;
end

endmodule

`endif

