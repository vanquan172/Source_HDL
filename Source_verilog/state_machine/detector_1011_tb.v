module detector_1011_tb ;

reg clk,clr,in ;
wire out  ;

detector_1011 uut (.clk(clk),.clr(clr),.in(in),.out(out)) ; 

initial 
    begin
        clk = 1 ; 
        forever #5  clk = ~clk ; 
    end 

initial 
    begin 
        clr = 1 ; 
        in = 0;

        // Apply reset
        #10 clr = 0; 
        
        // Test cases
        #10 in = 1;  // Bắt đầu chuỗi "1"
        #10 in = 0;  // "10"
        #10 in = 1;  // "101"
        #10 in = 1;  // "1011" - Expected output: out = 1

        #10 in = 0;  // Reset chuỗi, kiểm tra lại
        #10 in = 1;  // Bắt đầu chuỗi "1"
        #10 in = 0;  // "10"
        #10 in = 1;  // "101"
        #10 in = 0;  // Quay lại idle
        
        #10 in = 1;  // Bắt đầu chuỗi "1"
        #10 in = 0;  // "10"
        #10 in = 1;  // "101"
        #10 in = 1;  // "1011" - Expected output: out = 1

        // Dừng mô phỏng
        #20 $stop;
    end

    // Monitor the output
    initial begin
        $monitor("Time: %0d, clr: %b, in: %b, out: %b", $time, clr, in, out);
    end
endmodule 