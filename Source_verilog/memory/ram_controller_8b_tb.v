module ram_controller_8b_tb;

    reg clk;
    reg rst_n;
    reg [3:0] address;
    reg [7:0] data_in;
    wire [7:0] data_out;
    reg read, write, cs ; 

    // Instantiate RAM Controller
    ram_controller_8b uut (
        .clk(clk),
        .rst_n(rst_n),
        .address(address),
        .data_in(data_in),
        .data_out(data_out),
        .read(read),
        .write(write),
        .cs(cs)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        rst_n = 0;
        read = 0;
        write = 0;
        address = 0;
        data_in = 0;

        // Reset
        #10 rst_n = 1; cs = 1 ; 

        // Write data to RAM
        #10 address = 4'h0; data_in = 8'hA5; write = 1;
        #10 write = 0;

        #10 address = 4'h1; data_in = 8'h5A; write = 1;
        #10 write = 0;

        // Read data from RAM
        #10 address = 4'h0; read = 1;
        #10 read = 0;

        #10 address = 4'h1; read = 1;
        #10 read = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time = %t | Address = %h | Data In = %h | Data Out = %h | Read = %b | Write = %b",
                 $time, address, data_in, data_out, read, write);
    end

endmodule
