//test bench for d flip flop
//1. Declare module and ports

module dff_test;

    reg S,R, CLK;
    wire Q, QBAR;

    //2. Instantiate the module we want to test. We have instantiated the srff_behavior

    srff_behavior dut(.q(Q), .qbar(QBAR), .s(S), .r(R), .clk(CLK)); // instantiation by port name.

    //3. Monitor TB ports
    $monitor("simtime = %g, CLK = %b, S = %b, R = %b, Q = %b, QBAR = %b", $time, CLK, S, R, Q, QBAR);

    //4. apply test vectors
    initial begin
        clk=0;
        forever #10 clk = ~clk;  
    end 
    initial begin 
        S= 1; R= 0;
        #100; S= 0; R= 1; 
        #100; S= 0; R= 0; 
        #100;  S= 1; R=1; 
    end 
    
endmodule