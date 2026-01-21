module top;
  import uvm_pkg::*;
  import freq_pkg::*;
`include "uvm_macros.svh"
  logic clk;
  
  freq_if vif(clk);

  freq_divider dut (.clk(clk), .rst(vif.rst), .in(vif.in), .out(vif.out));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  

  initial begin
    uvm_config_db #(virtual freq_if)::set(null, "*", "vif", vif);
    run_test("sequence1_test");
  end
endmodule
