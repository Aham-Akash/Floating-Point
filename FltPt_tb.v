module FltPt_tb;

    reg  [31:0] i_a;
    reg  [31:0] i_b;
    wire  [31:0] o_result;

    // Instantiate the float add module
    FltPt FltPt_INST (.i_a(i_a),
                      .i_b(i_b),
			    	       .o_result(o_result)
				          );

    initial begin
        $monitor("Time: %0t | A: %h | B: %h | Result: %h", $time, i_a, i_b, o_result);

        $dumpfile("FltPt.vcd");
        $dumpvars (0, FltPt_INST) ;

        // Test Case 1: 2.9 + 2.8
        i_a = 32'h4039999A; // 2.9
        i_b = 32'h40366666; // 2.8
        #10;

        // Test Case 2: 0.5 + 4.5
        i_a = 32'h3F000000; // 0.5
        i_b = 32'h40900000; // 4.5
        #10;

        // Test Case 3: -2.9 + 5.8
        i_a = 32'hC039999A; // - 2.9
        i_b = 32'h40BA6666; // 5.8
        #10;

        // Test Case 4: Small values
        i_a = 32'h00000001; // Small value (subnormal)
        i_b = 32'h00000002; // Small value (subnormal)
        #10;

        // Test Case 5: Infinity
        i_a = 32'h7F800000; // Infinity
        i_b = 32'h3F800000;
        #10;

        // Test Case 6: NaN
        i_a = 32'h7FC00000; //NaN
        i_b = 32'h3F800000; // 1.0
        #10;

        $finish;

    end
endmodule




