module cyclic_encoder #(
    parameter n = 15,     // Tổng số bit mã hóa
    parameter k = 5,      // Số bit dữ liệu đầu vào (k)
    parameter m = 10      // Bậc đa thức sinh (g(x)) (n - k)
)(
    input clk,              // Đồng hồ
    input reset,            // Reset
    input [k-1:0] data_in,  // Dữ liệu đầu vào (k bit)
    input [m-1:0] g,        // Đa thức sinh (g(x)) dưới dạng nhị phân
    output reg [n-1:0] code_out // Dữ liệu mã hóa (n bit)
);

    // Phần dư của phép chia (n-k) bit
    reg [n-k-1:0] remainder; // Phần dư sau phép chia
    reg [n-1:0] shift_reg;   // Dữ liệu tạm trong bộ dịch
    integer i;

    // Phép chia nhị phân (modulo-2) giữa dữ liệu và đa thức sinh
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Khởi tạo lại giá trị bộ dịch và phần dư khi reset
            shift_reg <= 0;
            remainder <= 0;
            code_out <= 0;
        end else begin
            // Bước 1: Thêm bit 0 vào dữ liệu
            shift_reg <= {data_in, {n-k{1'b0}}}; // Thêm các bit 0 vào cuối dữ liệu

            // Bước 2: Thực hiện phép chia nhị phân với đa thức sinh
            for (i = 0; i < n - k; i = i + 1) begin
                if (shift_reg[n-1]) begin
                    // Thực hiện phép XOR với đa thức sinh
                    shift_reg <= shift_reg ^ (g << (n-k-1-i));
                end
                // Dịch bit trái cho phép chia tiếp
                shift_reg <= shift_reg << 1;
            end

            // Bước 3: Phần dư là các bit kiểm tra (parity)
            remainder <= shift_reg[n-k-1:0]; // Lấy phần dư (k bit cuối)
            code_out <= {data_in, remainder};  // Ghép dữ liệu ban đầu và phần dư
        end
    end
endmodule

