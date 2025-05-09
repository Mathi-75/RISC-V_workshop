\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   |calc
      @1
         $reset = *reset;
         $val2[31:0]=$rand2[3:0];
         $valid = $reset ? 0 : (>>1$valid + 1);
         $valid_or_reset = $valid || $reset;
      ?$valid_or_reset
         @1
            $val1[31:0] = >>2$out[31:0];
            $val2[31:0] = $rand2[3:0];
            
            
            $sum[31:0] = $val1 + $val2;
            $diff[31:0]= $val1 - $val2;
            $prod[31:0]= $val1 * $val2;
            $quot[31:0]= $val1 / $val2;
            $valid = $reset ? 0 : (>>1$valid + 1);
         @2
            $mem[31:0] = (op[1]) ? (($op[0]) ? $quot[31:0} : $prod[31:0]) : (($op[0]) ? $diff[31:0] : $sum[31:0]);
            
            $sel_sig = $reset | (!$valid);
            $out[31:0] = $sel_sig ? 32'd0 : $mem;
            
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
