module mux_4 (D_0, D_1, D_2, D_3, select, D_out); 
    input D_0, D_1, D_2, D_3;
    input [1:0] select;  
    output reg D_out; 

    always @(select, D_0, D_1, D_2, D_3)
    begin
        if (select == 2'b01)
            D_out = D_1;
        else if (select == 2'b10)
            D_out = D_2;
        else if (select == 2'b11)
            D_out = D_3;
        else
            D_out = D_0;
    end
endmodule
