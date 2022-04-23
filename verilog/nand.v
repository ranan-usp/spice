
module NAND_2_gate_level(output Y, input A, B);
    wire Yd;
    and(Yd, A, B);
    not(Y, Yd);
endmodule

module NAND_2_data_flow (output Y, input A, B);
    assign Y = ~(A & B);    
endmodule

module NAND_2_behavioral (output reg Y, input A, B);
always @ (A or B) begin
    if (A == 1'b1 & B == 1'b1) begin
        Y = 1'b0;
    end
    else 
        Y = 1'b1; 
end
endmodule