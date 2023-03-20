// module karatsuba_mult_3(
//     A, B, C
// );

// parameter m=3;
// parameter n=5;
// input [m-1:0]A;
// input [m-1:0]B;
// output [n-1:0]C;


// assign C[0]=A[0]*B[0];
// assign C[1]=(A[1]*B[0])^(A[0]*B[1]);
// assign C[2]=(A[2]*B[0])^(A[0]*B[2])^(A[1]*B[1]);
// assign C[3]=(A[1]*B[2])^(A[2]*B[1]);
// assign C[4]=A[2]*B[2];

// endmodule


module karatsuba_mult_3(
    A, B, C
);

parameter m=3;
parameter n=5;
input [m-1:0]A;
input [m-1:0]B;
output [n-1:0]C;


parameter p=(m+1)/2;

wire [p-1:0]A_l, B_l;
wire [p-2:0] A_h, B_h;
wire [2*p-4:0]C1;
wire [2*p-2:0]C4, C5, C6; //C1=A_h*B_h, C4=A_l*B_l, C_2=A_h+A_l, C_3=B_h+B_l, C_6=(A_h+A_l)*(B_h+B_l)+A_h*B_h+A_l*B_l
wire [p-1:0]C2, C3;

// wire [p-1:0]A_h, B_h, A_l, B_l;
// wire [2*p-2:0]C1, C4, C5, C6; //C1=A_h*B_h, C4=A_l*B_l, C_2=A_h+A_l, C_3=B_h+B_l, C_6=(A_h+A_l)*(B_h+B_l)+A_h*B_h+A_l*B_l
// wire [p-1:0]C2, C3;

assign A_l=A[p-1:0];
assign A_h=A[m-1:p];
assign B_l=B[p-1:0];
assign B_h=B[m-1:p];

assign C2=A_h^A_l;
assign C3=B_h^B_l;


// karatsuba_mult_2 M1(A_h, B_h, C1);
assign C1=A_h*B_h;
karatsuba_mult_2 M2(A_l, B_l, C4);
karatsuba_mult_2 M3(C2, C3, C5);
assign C6=C5^C1^C4;


assign C=(C1<<(m+1))^(C6<<p)^C4;
// initial begin
// $display("at3=%b\n", C);
// end

endmodule


