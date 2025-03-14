`timescale 1ns / 1ps

module mux21 (
    input wire i1,    // Đầu vào 1
    input wire i2,    // Đầu vào 2
    input wire s,    // Tín hiệu chọn
    output wire o    // Đầu ra
);

// Logic MUX 2:1
assign o = s ? i2 : i1;

endmodule
