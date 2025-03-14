

`timescale 1ns / 1ps

module mux21_tb;

    // Khai báo tín hiệu
    reg in1, in2, sel;   // Các tín hiệu đầu vào
    wire out;            // Tín hiệu đầu ra

    // Kết nối module mux21
    mux21 uut (
        .in1(i1), 
        .in2(i2), 
        .sel(s), 
        .out(o)
    );

    // Khối kiểm tra
    initial begin
        // Hiển thị tiêu đề của kết quả mô phỏng
        $display("Time\t sel\t in1\t in2\t out");
        $monitor("%g\t %b\t %b\t %b\t %b", $time, sel, in1, in2, out);

        // Trường hợp 1: sel = 0, out = in1
        sel = 0; in1 = 0; in2 = 0; #10;  // Thời gian: 10 ns
        sel = 0; in1 = 1; in2 = 0; #10;  // Thời gian: 20 ns

        // Trường hợp 2: sel = 1, out = in2
        sel = 1; in1 = 0; in2 = 1; #10;  // Thời gian: 30 ns
        sel = 1; in1 = 1; in2 = 1; #10;  // Thời gian: 40 ns

        $stop;  // Kết thúc mô phỏng
    end

endmodule
