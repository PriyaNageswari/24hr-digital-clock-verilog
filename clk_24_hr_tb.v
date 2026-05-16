module clk_24_hr_tb;
	reg clk,rst;
	wire [3:0]h1,h0,m1,m0,s1,s0;

	clk_24_hr dut(clk,rst,h1,h0,m1,m0,s1,s0);
	always #5 clk = ~clk;
	
	initial begin
		clk = 0; rst = 1; #5
		rst = 0; #50000
		$stop;
	end
endmodule
