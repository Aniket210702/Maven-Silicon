module msrv32_img(
    input [2:0] imm_type_in,
    input [31:7] instr_in,
    output reg [31:0] imm_out
);
    always @(imm_type_in, instr_in)
    begin
        case (imm_type_in)
            3'b000: imm_out = {{20{instr_in[31]}}, instr_in[31:20]};
            3'b001: imm_out = {{20{instr_in[31]}}, instr_in[31:20]}; 
            3'b010: imm_out = {{20{instr_in[31]}}, instr_in[31:25], instr_in[11:7]}; 
            3'b011: imm_out = {{20{instr_in[31]}}, instr_in[7], instr_in[30:25], instr_in[11:8], 1'b0}; 
            3'b100: imm_out = {instr_in[31:12], 12'h000}; 
            3'b101: imm_out = {{12{instr_in[31]}}, instr_in[19:12], instr_in[20], instr_in[30:21], 1'b0};              
            3'b110: imm_out = {27'b0,instr_in[19:15]};
            3'b111: imm_out = {{20{instr_in[31]}}, instr_in[31:20]}; 
            default: imm_out = 32'h0; 
        endcase
    end
endmodule

