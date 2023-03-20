module karatsuba_mult4_tb();

    parameter m=163;
    parameter n=325;

    wire [m-1:0] O;
    reg [m-1:0]A, B;

    karatsuba_mult163_red KM(A, B, O);

    initial
    begin
        $monitor(" input_a=%h , input_b=%h\n",A, B);
        $dumpfile ("karatsuba_mult4.vcd");
        $dumpvars (0,karatsuba_mult4_tb);
        A=163'h8000000000000000000000000000000000000001;
        B=163'h8000000000000000000000000000000000000001;
        #20
        $display("input_a=%h , input_b=%h, Output=%h\n",A,B,O);

        A=163'h810000000000000000000000000000000000001;
        B=163'h820000000000000000000000000000000000001;
        #20
        $display("input_a=%h , input_b=%h, Output=%h\n",A,B,O);

        A=163'h7ffffffffffffffffffffffffffffffffffffffff;
        B=163'h7ffffffffffffffffffffffffffffffffffffffff;
        #20
        $display("input_a=%h , input_b=%h, Output=%h\n",A,B,O);
    end

endmodule