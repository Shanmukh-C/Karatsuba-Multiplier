module karatsuba_mult163_red(A,B,O);

parameter m=163;
parameter n=325;

input [m-1:0]A, B;
output [m-1:0]O;
// output [n-1:0]C;
// karatsuba_mult_163 KM(A, B, C);

wire [n-1:0]C;
wire [m-1:0]O1,O2,O3,O4;
wire [m-1:0]C1, C2, C3, C4;
wire [82:0]C5;
wire [32:0]C6;
wire [37:0]C7;
wire [7:0]C8;

karatsuba_mult_163 KM(A, B, C);

assign O1=C[m-1:0];
// // assign C1=(1<<80)^(1<<47)^(1<<9)^(1);
// // assign C2=(1<<130)^(1<<92)^(1<<83)^(1<<80)^(1<<47)^(1<<9)^(1);
// // assign C3=(1<<125)^(1<<116)^(1<<113)^(1<<47)^(1<<42)^(1<<33)^(1<<9)^(1);
// // assign C4=(1<<154)^(1<<151)^(1<<85)^(1<<71)^(1<<38)^(1<<9)^(1);

assign C5=C[245:163];
assign C6=C[278:246];
assign C7=C[316:279];
assign C8=C[324:317];

assign O2=O1^(C5<<80)^(C5<<47)^(C5<<9)^(C5);
assign O3=O2^(C6<<130)^(C6<<92)^(C6<<83)^(C6<<80)^(C6<<47)^(C6<<9)^(C6);
assign O4=O3^(C7<<125)^(C7<<116)^(C7<<113)^(C7<<47)^(C7<<42)^(C7<<33)^(C7<<9)^(C7);
assign O=O4^(C8<<154)^(C8<<151)^(C8<<85)^(C8<<71)^(C8<<38)^(C8<<9)^(C8);

endmodule