
module srff_gate(q, qbar, s, r, clk);

    input s,r,clk; 
    output q, qbar;

    wire nand1_out; // output of nand1 
    wire nand2_out; // output of nand2 

    nand (nand1_out,clk,s); 
    nand (nand2_out,clk,r); 
    nand (q,nand1_out,qbar);
    nand (qbar,nand2_out,q);

endmodule

module srff_dataflow(q,qbar,s,r,clk);

    input s,r,clk;
    output q, qbar;

    assign q = clk? (s + ((~r) & q)) : q;
    assign qbar = ~q;

endmodule

module srff_behave(s,r,clk, q, qbar);

    input s,r,clk;
    output reg q, qbar;

    always@(posedge clk)
    begin

        if(s == 1)
            begin
            q = 1;
            qbar = 0;
            end
        else if(r == 1)
            begin
            q = 0;
            qbar =1;
            end
        else if(s == 0 & r == 0) 
            begin 
            q <= q;
            qbar <= qbar
            end
    end
endmodule