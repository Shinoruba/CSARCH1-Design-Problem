/*
  Element Usage Report
    Clock - 1 times
    DflipFlop - 4 times
    AndGate - 10 times
    OrGate - 17 times
    Splitter - 1 times
    Decoder - 1 times
    Output - 7 times
    Input - 1 times
    NotGate - 1 times
*/

/*
  Usage Instructions and Tips
    Labels - Ensure unique label names and avoid using verilog keywords
    Warnings - Connect all optional inputs to remove warnings
    Clock - Use a single global clock

    Instructions on how to run code:
    - Open:   Command Prompt
    - Type:   iverilog -o HOMSSI_S14_DP.vvp HOMSSI_S14_DP.v HOMSSI_S14_DP_tb.v
    - Type:   vvp HOMSSI_S14_DP.vvp

      You should see results now, thank you sir, pls give me full grades
*/


module EulerTotient(R,CLK_LABEL,A,B,C,D,E,F,G);
  output A,  B,  C,  D,  E,  F,  G;
  input R, CLK_LABEL;
  wire DA_Q, DA_Q_inv, and_0_out, or_0_out, and_3_out, and_2_out, and_1_out, Decoder_0_out_0, Decoder_0_out_1, Decoder_0_out_2, Decoder_0_out_3, Decoder_0_out_4, Decoder_0_out_5, Decoder_0_out_6, Decoder_0_out_7, Decoder_0_out_8, Decoder_0_out_9, Decoder_0_out_10, Decoder_0_out_11, Decoder_0_out_12, Decoder_0_out_13, Decoder_0_out_14, Decoder_0_out_15, \8_GATE_out , or_15_out, or_14_out, or_16_out, or_12_out, or_6_out, or_11_out, or_13_out, \6_GATE_out , C_GATE_out, \4_GATE_out , A_GATE_out, \2_GATE_out , \1_GATE_out , DB_Q, DB_Q_inv, and_6_out, or_1_out, and_5_out, and_4_out, DC_Q, DC_Q_inv, and_7_out, or_2_out, and_8_out, DD_Q, DD_Q_inv, and_9_out, not_0_out;
  wire [3:0] Splitter_0_cmb;
  DflipFlop DA(DA_Q, DA_Q_inv, CLK_LABEL, or_0_out, , , );
  assign and_0_out = DA_Q_inv & not_0_out & DB_Q & DC_Q & DD_Q;
  assign or_0_out = and_0_out | and_1_out | and_2_out | and_3_out;
  assign and_3_out = not_0_out & DA_Q & DD_Q_inv;
  assign and_2_out = not_0_out & DA_Q & DC_Q_inv;
  assign and_1_out = not_0_out & DA_Q & DB_Q_inv;
  assign Splitter_0_cmb = {DD_Q,DC_Q,DB_Q,DA_Q};
  Decoder16 #(4) Decoder_0(Decoder_0_out_0, Decoder_0_out_1, Decoder_0_out_2, Decoder_0_out_3, Decoder_0_out_4, Decoder_0_out_5, Decoder_0_out_6, Decoder_0_out_7, Decoder_0_out_8, Decoder_0_out_9, Decoder_0_out_10, Decoder_0_out_11, Decoder_0_out_12, Decoder_0_out_13, Decoder_0_out_14, Decoder_0_out_15, Splitter_0_cmb);
  assign \8_GATE_out  = Decoder_0_out_14 | Decoder_0_out_15;
  assign or_15_out = \4_GATE_out  | \6_GATE_out  | \8_GATE_out  | A_GATE_out | C_GATE_out;
  assign F = or_15_out;
  assign or_14_out = \2_GATE_out  | \4_GATE_out  | \6_GATE_out  | \8_GATE_out  | A_GATE_out;
  assign G = or_14_out;
  assign or_16_out = C_GATE_out | A_GATE_out | \8_GATE_out  | \6_GATE_out  | \2_GATE_out ;
  assign A = or_16_out;
  assign or_12_out = \2_GATE_out  | \6_GATE_out  | \8_GATE_out  | C_GATE_out;
  assign D = or_12_out;
  assign or_6_out = \1_GATE_out  | \2_GATE_out  | \4_GATE_out  | \8_GATE_out  | A_GATE_out;
  assign B = or_6_out;
  assign or_11_out = \1_GATE_out  | \4_GATE_out  | \6_GATE_out  | \8_GATE_out  | A_GATE_out;
  assign C = or_11_out;
  assign or_13_out = \2_GATE_out  | \6_GATE_out  | \8_GATE_out  | A_GATE_out | C_GATE_out;
  assign E = or_13_out;
  assign \6_GATE_out  = Decoder_0_out_6 | Decoder_0_out_8 | Decoder_0_out_13;
  assign C_GATE_out = Decoder_0_out_12;
  assign \4_GATE_out  = Decoder_0_out_4 | Decoder_0_out_7 | Decoder_0_out_9 | Decoder_0_out_11;
  assign A_GATE_out = Decoder_0_out_10;
  assign \2_GATE_out  = Decoder_0_out_2 | Decoder_0_out_3 | Decoder_0_out_5;
  assign \1_GATE_out  = Decoder_0_out_0 | Decoder_0_out_1;
  DflipFlop DB(DB_Q, DB_Q_inv, CLK_LABEL, or_1_out, , , );
  assign and_6_out = DB_Q_inv & not_0_out & DC_Q & DD_Q;
  assign or_1_out = and_6_out | and_4_out | and_5_out;
  assign and_5_out = not_0_out & DB_Q & DD_Q_inv;
  assign and_4_out = not_0_out & DB_Q & DC_Q_inv;
  DflipFlop DC(DC_Q, DC_Q_inv, CLK_LABEL, or_2_out, , , );
  assign and_7_out = not_0_out & DC_Q_inv & DD_Q;
  assign or_2_out = and_7_out | and_8_out;
  assign and_8_out = not_0_out & DC_Q & DD_Q_inv;
  DflipFlop DD(DD_Q, DD_Q_inv, CLK_LABEL, and_9_out, , , );
  assign and_9_out = not_0_out & DD_Q_inv;
  assign not_0_out = ~R;
endmodule

module DflipFlop(q, q_inv, clk, d, a_rst, pre, en);
    parameter WIDTH = 1;
    output reg [WIDTH-1:0] q, q_inv;
    input clk, a_rst, pre, en;
    input [WIDTH-1:0] d;

    always @ (posedge clk or posedge a_rst)
    if (a_rst) begin
        q <= 'b0;
        q_inv <= 'b1;
    end else if (en == 0) ;
    else begin
        q <= d;
        q_inv <= ~d;
    end
endmodule
    
module Decoder16(out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, sel);
  output reg out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15;
  input [3:0] sel;
  
  always @ (*) begin
    out0 = 0;
    out1 = 0;
    out2 = 0;
    out3 = 0;
    out4 = 0;
    out5 = 0;
    out6 = 0;
    out7 = 0;
    out8 = 0;
    out9 = 0;
    out10 = 0;
    out11 = 0;
    out12 = 0;
    out13 = 0;
    out14 = 0;
    out15 = 0;
    case (sel)
      0 : out0 = 1;
      1 : out1 = 1;
      2 : out2 = 1;
      3 : out3 = 1;
      4 : out4 = 1;
      5 : out5 = 1;
      6 : out6 = 1;
      7 : out7 = 1;
      8 : out8 = 1;
      9 : out9 = 1;
      10 : out10 = 1;
      11 : out11 = 1;
      12 : out12 = 1;
      13 : out13 = 1;
      14 : out14 = 1;
      15 : out15 = 1;
    endcase
  end
endmodule
