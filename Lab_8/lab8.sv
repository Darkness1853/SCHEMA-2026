module lab8 (
    input logic clk,
    input logic rst,
    input logic btn,
    output logic [6:0] seg,
    output logic [3:0] dig
);
    logic [3:0] cnt;
    logic btn_clean;
	 logic btn_prev;
    logic rst_inv;
    logic btn_inv;
    logic [6:0] seg_temp;
    
    assign rst_inv = ~rst;
    assign btn_inv = ~btn;
    
    antitinkling no_click_click (
        .button (btn_inv),
        .clk    (clk),
        .reset  (rst_inv),
        .out    (btn_clean)
    );

    always_ff @(posedge clk or posedge rst_inv) begin
        if (rst_inv) begin
            cnt <= 4'b0;
				btn_prev <= 1'b0;
			end
        else begin
            btn_prev <= btn_clean;
				if (btn_clean & ~btn_prev)
					cnt <= cnt + 1;
		end
	end
    always_comb begin
		seg_temp = 7'b0000000;
        case (cnt)
            4'h0: seg_temp = 7'b0111111;
            4'h1: seg_temp = 7'b0000110;
            4'h2: seg_temp = 7'b1011011;
            4'h3: seg_temp = 7'b1001111;
            4'h4: seg_temp = 7'b1100110;
            4'h5: seg_temp = 7'b1101101;
            4'h6: seg_temp = 7'b1111101;
            4'h7: seg_temp = 7'b0000111;
            4'h8: seg_temp = 7'b1111111;
            4'h9: seg_temp = 7'b1101111;
            4'hA: seg_temp = 7'b1110111;
            4'hB: seg_temp = 7'b1111100;
            4'hC: seg_temp = 7'b0111001;
            4'hD: seg_temp = 7'b1011110;
            4'hE: seg_temp = 7'b1111001;
            4'hF: seg_temp = 7'b1110001;
        endcase
    end
    
    assign seg = ~seg_temp;      
    assign dig = 4'b0111;      
endmodule

module antitinkling (
    input logic button,
    input logic clk,
    input logic reset,
    output logic out
);
    logic [19:0] cnt;
    logic btn_sync1, btn_sync2;
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            btn_sync1 <= 1'b0;
            btn_sync2 <= 1'b0;
            cnt <= 20'b0;
            out <= 1'b0;
        end
        else begin
            btn_sync1 <= button;
            btn_sync2 <= btn_sync1;
            
            if (btn_sync2) begin
                if (cnt == 20'hFFFFF) begin
                    out <= 1'b1;
                end
                else begin
                    cnt <= cnt + 1;
                    out <= 1'b0;
                end
            end
            else begin
                cnt <= 20'b0;
                out <= 1'b0;
            end
        end
    end
endmodule