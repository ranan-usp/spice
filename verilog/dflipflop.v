module dff_behavioral(d,clk,clear,q,qbar); 

    input d, clk, clear; 
    output reg q, qbar; 

    always@(posedge clk) 

    begin
        if(clear== 1)
            q <= 0;
            qbar <= 1;
        else 
            q <= d; 
            qbar = !d; 
    end 

endmodule


module dff_behavioral(d,clk,clear,q,qbar); 

    input d, clk, clear; 
    output reg q, qbar; 

    always@(posedge clk or posedge clear) 

    begin
        if(clear== 1)
            q <= 0;
            qbar <= 1;
        else 
            q <= d; 
            qbar = !d; 
    end 

endmodule