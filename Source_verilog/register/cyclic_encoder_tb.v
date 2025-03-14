module cyclic_encoder_tb;

    // Tham số tổng quát của bộ mã hóa
    parameter n = 15;       // Tổng số bit mã hóa 👎
    parameter k = 5;        // Số bit dữ liệu đầu vào (k)
    parameter m = n - k;    // Bậc đa thức sinh (g(x)) (n - k)

    // Tín hiệu đầu vào cho bộ mã hóa
    reg clk;                // Tín hiệu đồng hồ
    reg reset;              // Tín hiệu reset
    reg [k-1:0] data_in;   // Dữ liệu đầu vào (k bit)

    // Tín hiệu đầu ra từ bộ mã hóa
    wire [n-1:0] code_out; // Dữ liệu mã hóa (n bit)

    // Đa thức sinh g(x) được truyền vào bộ mã hóa (tùy chỉnh theo yêu cầu)
    reg [m-1:0] g;         // Đa thức sinh (g(x)) dưới dạng nhị phân

    // Tạo tín hiệu đồng hồ
    always begin
        #5 clk = ~clk;  // Tạo đồng hồ có chu kỳ 10 đơn vị thời gian
    end

    // Khởi tạo và kiểm tra
    initial begin
        // Khởi tạo tín hiệu
        clk = 0;
        reset = 0;
        data_in = 0;   // Bắt đầu với dữ liệu đầu vào là 0
        g = 0;          // Đặt g(x) ban đầu là 0

        // Xử lý reset
        reset = 1;           // Đặt reset là 1
        #10 reset = 0;       // Sau 10 đơn vị thời gian, reset về 0

        // Cung cấp dữ liệu đầu vào
        data_in = 5'b10001;  // Ví dụ dữ liệu đầu vào
        g = 5'b10101; 
        #10; 
        data_in = 5'b11010;  // Cập nhật dữ liệu đầu vào
    //    #10 data_in = 5'b01101;  // Cập nhật dữ liệu đầu vào

        // Đặt lại g(x) (đa thức sinh)
               // Ví dụ đa thức sinh g(x) = x^4 + x^2 + x + 1 (g = 10101)
        g = 5'b11001;        // Đặt g(x) mới
        #10 ; 
        // Chờ một thời gian để mô phỏng và kiểm tra kết quả
        #50;
        
        // Kết thúc mô phỏng
        $stop;
    end

    // Khởi tạo bộ mã hóa
    cyclic_encoder #(
        .n(n), 
        .k(k), 
        .m(m)
    ) encoder (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .g(g),
        .code_out(code_out)
    );

    // Kiểm tra đầu ra trong quá trình mô phỏng
    initial begin
        $monitor("At time %t, data_in = %b, g = %b, code_out = %b", $time, data_in, g, code_out);
    end

endmodule