\m5_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m4_include_lib(https://raw.githubusercontent.com/stevehoover/makerchip_examples/refs/heads/master/pythagoras_viz.tlv)
   
   m5_makerchip_module
\TLV
   |calc
      ?$valid
         // Pythagoras's Theorem
         @1
            $aa_sq[7:0] = $aa[3:0] ** 2;
            $bb_sq[7:0] = $bb[3:0] ** 2;
         @2
            $cc_sq[8:0] = $aa_sq + $bb_sq;
         @3
            $cc[4:0] = sqrt($cc_sq);
         @4
            $tot_dist[63:0] = *reset ? '0 : $valid ? >>1$tot_dist + $cc : >>1$tot_dist;
            // VIZ and LOG output.
            // Note that this can affect the logic in the DIAGRAM. You may comment this out.
            m5+pythagorean_viz_and_log(1)
\SV
   endmodule