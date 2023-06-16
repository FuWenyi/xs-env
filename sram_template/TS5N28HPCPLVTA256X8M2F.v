module TS5N28HPCPLVTA256X8M2F(
    Q, CLK, CEB, WEB, A, D
);
parameter Bits = 8;
parameter Word_Depth = 256;
parameter Add_Width = 8;

output  reg [Bits-1:0]      Q;
input                   CLK;
input                   CEB;
input                   WEB;
input   [Add_Width-1:0] A;
input   [Bits-1:0]      D;

reg [Bits-1:0] ram [0:Word_Depth-1];
always @(posedge CLK) begin
    if(!CEB && !WEB) begin
        ram[A] <= D;
    end
    Q <= !CEB && WEB ? ram[A] : {4{$random}};
end

endmodule