
module XNOR_2(output Y, input A, B);
  xnor(Y, A, B);
endmodule

module XNOR_2_data_flow (output Y, input A, B);
   assign Y = ~(A ^ B);
endmodule

module XNOR_2_behavioral (output reg Y, input A, B);
always @ (A or B) begin
   if (A == 1'b0 & B == 1'b0) begin
       Y = 1'b1;
   end
   if (A == 1'b1 & B == 1'b1) begin
       Y = 1'b1;
   end
   else 
       Y = 1'b0;
end
endmodule