`include "NOT_behavioral.v"
module NOT_behavioral_tb;
reg A;wire Y;
NOT_behavioral Instance0 (Y, A);
initial begin
     A = 0;
  #1 A = 1;
  #1 A = 0;
 end
 initial begin
    $monitor ("%t | A = %d| Y = %d", $time, A, Y);
    $dumpfile("dump.vcd");
    $dumpvars();
end
endmodule