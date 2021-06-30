import wires::*;
import functions::*;

module bit_clmul
(
  input logic rst,
  input logic clk,
  input bit_clmul_in_type bit_clmul_in,
  output bit_clmul_out_type bit_clmul_out
);
  timeunit 1ns;
  timeprecision 1ps;

  bit_clmul_reg_type r,rin;
  bit_clmul_reg_type v;

  always_comb begin

    v = r;

    case (r.state)
      0 : begin
        if ((bit_clmul_in.enable & (bit_clmul_in.op.bit_clmul |
            bit_clmul_in.op.bit_clmulh | bit_clmul_in.op.bit_clmulr)) == 1) begin
          v.state = 1;
        end
        v.ready = 0;
      end
      1 : begin
        if (r.counter == 31) begin
          v.state = 2;
        end else begin
          v.counter = v.counter + 1;
        end
        v.ready = 0;
      end
      default : begin
        v.state = 0;
        v.ready = 1;
      end
    endcase

  case (r.state)
    0 : begin
      v.data1 = bit_clmul_in.data1;
      v.data2 = bit_clmul_in.data2;
      v.op = bit_clmul_in.op;
      v.counter = 0;
      if (v.op.bit_clmulh == 1) begin
        v.index = 32;
      end else if (v.op.bit_clmulr == 1) begin
        v.index = 31;
      end
      v.swap = 0;
      v.result = 0;
    end
    1 : begin
      if (v.data2[r.counter] == 1) begin
        if (v.op.bit_clmul == 1) begin
          v.swap = v.data1 << r.counter;
        end else if (v.op.bit_clmulh == 1 || v.op.bit_clmulr == 1) begin
          v.swap = v.data1 >> (r.index-r.counter);
        end
        v.result = v.result ^ v.swap;
      end
    end
    default : begin
    end
  endcase

  bit_clmul_out.result = v.result;
  bit_clmul_out.ready = v.ready;

  rin = v;

  end

  always_ff @ (posedge clk) begin
    if (rst == 0) begin
      r <= init_mul_reg;
    end else begin
      r <= rin;
    end

  end

endmodule
