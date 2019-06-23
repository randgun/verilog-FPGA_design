module in_ctrl(
input CLK_1K,
input RSTN,
inpat [3:0]key_value,
input flag,
input [23:0]num result,
output reg[23:0]num_regl,
outpat reg[23:0]num _reg2,
output reg[3:0]opcode,
output [23:0]num out
);

localparam IDLE = 4'b000;
localparam SO = 4'b001;
localparam S1=4'b010;
localparam S2=4'b100;
assign num_out=num reg2 ? num reg2:num regl;
reg [3:0] state_now,state_nxt;
reg [3:0] opcode_reg;

always@(posedge CLK_1K or negedge RSTN)
begin
if(~RSTN)
  state now <= S0;
else
  state now <= state _nxt;
end

always@(posedge CLK_1K or negedge RSTN)
begin
  if(~RSTN)
    begin
      num_regl<=0;
      num_reg2<=0;
      opcode_reg<=0;
      opcode<=0;
    end
   else if(flag)
   
    case(state_now)
    
    SO:if((key_value >= 4'h0)&&(key_value <= 4'h9))
        num_reg1 <= {num reg1[19:0],key value};
      else if(key_value>=4'ha && key_value <= 4'hd)
        begin
          state_nxt<=S1;
          opcode_reg <= key_value;
        end
    Sl:if(key_value >= 4'ha && key value<= 4'hd)
        opcode_reg <= key_value;
      else if(key_value >= 4'h0 && key_value <= 4'h9)
        begin
          num_reg2 <= {num_reg2(19:0],key_value[3:0]};
          opcode<=opcode_reg;
        end
      else if(key_value == 4'he)
        begin
          num_reg1 <= num_result;
          num_reg2 <= 0;
          opcode_reg <= 0;
          state_nxt <= S2;
        end
    S2:if(key_value>=4'h0 && key_value<=4'h9)
        begin
          num_reg1 <= key_value;
          state_nxt <= S0;
        end
        else if((key_value >= 4'ha) && (key_value <= 4'hd))
          begin
            opcode_reg <= key_value;
            State_nxt <= S1;
          end
    endcase
end
endmodule
