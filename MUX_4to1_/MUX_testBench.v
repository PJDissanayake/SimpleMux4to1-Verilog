module mux_tb;
    // Define signals for inputs and outputs
    reg D_0, D_1, D_2, D_3;
    reg [1:0] select;
    wire D_out;
   //Installing mux_4 module 
 mux_4 tb (
        .D_0(D_0),
        .D_1(D_1),
        .D_2(D_2),
        .D_3(D_3),
        .select(select),
        .D_out(D_out)
    );
    
    // Generating Clock 
    reg clk = 0;
    always #5 clk = ~clk;
    always #20 D_0 = ~D_0;
     // Data Line Signal generation
    always #30 D_1 = ~D_1;
    always #40 D_2 = ~D_2;
    always #50 D_3 = ~D_3;

    // Initialize inputs
    initial begin
        D_0 = 1;
        D_1 = 1;
        D_2 = 0;
        D_3 = 1;
        select = 2'b00;
        // Simulate the behavior for different select values
        #200 select = 2'b01; 
        #200 select = 2'b10; 
        #200 select = 2'b11; 
        #200 select = 2'b00; 
        // End simulation
        $finish;
    end

    // Monitor for displaying outputs
    always @(posedge clk) begin
        $display("Time = %0t: D_out = %b", $time, D_out);
    end

endmodule