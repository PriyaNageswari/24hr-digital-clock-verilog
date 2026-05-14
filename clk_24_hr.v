module clk_24_hr(input clk,rst, output reg [3:0]h1,h0,m1,m0,s1,s0);
    initial begin
        h1 <= 0; h0 <= 0; m1 <= 0; m0 <= 0; s1 <= 0; s0 <= 0;
    end
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            h1 <= 0; h0 <= 0; m1 <= 0; m0 <= 0; s1 <= 0; s0 <= 0;
        end
        else 
        begin
            if(h1 == 2 && h0 == 3 && m1 == 5 && m0 == 9 && s1 == 5 && s0 == 9) begin
                h1 <= 0; h0 <= 0; m1 <= 0; m0 <= 0; s1 <= 0; s0 <= 0;
            end
            else
            begin
                s0 <= s0 + 1;
                if(s0 == 9)
                begin
                    s0 <= 0; 
                    s1 <= s1 + 1;
                    if(s1 == 5)
                    begin
                        s0 <= 0; s1 <= 0;
                        m0 <= m0 + 1;
                        if(m0 == 9)
                        begin
                            s0 <= 0; s1 <= 0; m0 <= 0;
                            m1 <= m1 + 1;
                            if(m1 == 5)
                            begin 
                                s0 <= 0; s1 <= 0; m0 <= 0; m1 <= 0; 
                                h0 <= h0 + 1;
                                if(h0 == 9)
                                begin
                                    s0 <= 0; s1 <= 0; m0 <= 0; m1 <= 0; h0 <= 0;
                                    h1 <= h1 + 1;
                                    if(h1 == 2 && h0 == 3)
                                    begin
                                        h1 <= 0; h0 <= 0; m1 <= 0; m0 <= 0; s1 <= 0; s0 <= 0;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
endmodule
