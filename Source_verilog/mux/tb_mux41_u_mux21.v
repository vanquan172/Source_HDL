`timescale 1ns / 1ps
module tb_mux41_u_mux21;

    // Khai báo các tín hiệu
    reg a, b, c, d;
    reg [1:0] sel;
    wire y;

    // Kết nối module với testbench
    mux41_u_mux21 uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .sel(sel), 
        .y(y)
    );

    // Khối khởi tạo cho testbench
    initial begin
        // Hiển thị các tín hiệu để quan sát trong quá trình mô phỏng
        $monitor("Time = %0d | a = %b, b = %b, c = %b, d = %b, sel = %b, y = %b", 
                 $time, a, b, c, d, sel, y);

        // Gán các giá trị đầu vào ban đầu
        {a, b, c, d} = 4'b1010;  // Giả sử giá trị ban đầu của a, b, c, d là 1010

        // Kiểm tra tất cả các trường hợp của sel (00, 01, 10, 11)
        sel = 2'b00; #10;   // sel = 00 -> y phải bằng a
        sel = 2'b01; #10;   // sel = 01 -> y phải bằng b
        sel = 2'b10; #10;   // sel = 10 -> y phải bằng c
        sel = 2'b11; #10;   // sel = 11 -> y phải bằng d

        // Thay đổi đầu vào để kiểm tra thêm
        {a, b, c, d} = 4'b1101;  // Đổi giá trị của a, b, c, d
        sel = 2'b00; #10;        // Kiểm tra lại với sel = 00
        sel = 2'b01; #10;        // Kiểm tra lại với sel = 01
        sel = 2'b10; #10;        // Kiểm tra lại với sel = 10
        sel = 2'b11; #10;        // Kiểm tra lại với sel = 11

        // Kết thúc mô phỏng
        $finish;
    end

endmodule

