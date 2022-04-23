module NOT_gate_level(output Y, input A);
    not (Y, A);
endmodule

module NOT_data_flow (output Y, input A);
    assign Y = ~A;
endmodule

module NOT_behavioral (output reg Y, input A);
always @ (A) begin
    if (A == 1'b0 ) begin
        Y = 1'b1;
    end
    else if (A == 1'b1) begin
       Y = 1'b0;
end
endmodule

