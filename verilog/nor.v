
module NOR_2_gate_level(output Y, input A, B);
   nor(Y, A, B); 
endmodule

module NOR_2_data_flow (output Y, input A, B);
assign Y = ~(A | B);
endmodule

module NOR_2_behavioral (output reg Y, input A, B);
always @ (A or B) begin
    if (A == 1'b0 & B == 1'b0) begin
        Y = 1'b1;
    end
    else 
        Y = 1'b0; 
end
endmodule