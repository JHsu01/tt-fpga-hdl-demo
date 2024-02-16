//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 40

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
//_\source top.tlv 112

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   
   logic [31:0] r;
   always @(posedge clk) r <= 0;
   assign ui_in = 8'b00000001;
   
   logic ena = 1'b0;
   logic rst_n = ! reset;

   /*
   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 4'h0;
      #10 // Step 5 cycles, past reset.
         ui_in = 4'hFF;
      // ...etc.
   end
   */

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   //assign passed = top.cyc_cnt > 60;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /*   // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    */
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar digit, input_label, leds, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|clock_time$cycounter.
logic [24:0] FpgaPins_Fpga_CLOCK_TIME_cycounter_a0,
             FpgaPins_Fpga_CLOCK_TIME_cycounter_a1;

// For /fpga_pins/fpga|clock_time$digit.
logic [3:0] FpgaPins_Fpga_CLOCK_TIME_digit_a0;

// For /fpga_pins/fpga|clock_time$ones_digit.
logic [3:0] FpgaPins_Fpga_CLOCK_TIME_ones_digit_a0,
            FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1;

// For /fpga_pins/fpga|clock_time$pulse.
logic FpgaPins_Fpga_CLOCK_TIME_pulse_a0;

// For /fpga_pins/fpga|clock_time$refresh.
logic FpgaPins_Fpga_CLOCK_TIME_refresh_a0;

// For /fpga_pins/fpga|clock_time$reset.
logic FpgaPins_Fpga_CLOCK_TIME_reset_a0;

// For /fpga_pins/fpga|clock_time$show_tens.
logic FpgaPins_Fpga_CLOCK_TIME_show_tens_a0,
      FpgaPins_Fpga_CLOCK_TIME_show_tens_a1;

// For /fpga_pins/fpga|clock_time$showbits.
logic [6:0] FpgaPins_Fpga_CLOCK_TIME_showbits_a0;

// For /fpga_pins/fpga|clock_time$tens_digit.
logic [3:0] FpgaPins_Fpga_CLOCK_TIME_tens_digit_a0,
            FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |clock_time
         //

            // Staging of $cycounter.
            always_ff @(posedge clk) FpgaPins_Fpga_CLOCK_TIME_cycounter_a1[24:0] <= FpgaPins_Fpga_CLOCK_TIME_cycounter_a0[24:0];

            // Staging of $ones_digit.
            always_ff @(posedge clk) FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1[3:0] <= FpgaPins_Fpga_CLOCK_TIME_ones_digit_a0[3:0];

            // Staging of $show_tens.
            always_ff @(posedge clk) FpgaPins_Fpga_CLOCK_TIME_show_tens_a1 <= FpgaPins_Fpga_CLOCK_TIME_show_tens_a0;

            // Staging of $tens_digit.
            always_ff @(posedge clk) FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1[3:0] <= FpgaPins_Fpga_CLOCK_TIME_tens_digit_a0[3:0];








//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |clock_time
            //
            if (1) begin : P_clock_time
               (* keep *) logic [24:0] \///@0$cycounter ;
               assign \///@0$cycounter = FpgaPins_Fpga_CLOCK_TIME_cycounter_a0;
               (* keep *) logic [3:0] \///@0$digit ;
               assign \///@0$digit = FpgaPins_Fpga_CLOCK_TIME_digit_a0;
               (* keep *) logic [3:0] \///@0$ones_digit ;
               assign \///@0$ones_digit = FpgaPins_Fpga_CLOCK_TIME_ones_digit_a0;
               (* keep *) logic  \///@0$pulse ;
               assign \///@0$pulse = FpgaPins_Fpga_CLOCK_TIME_pulse_a0;
               (* keep *) logic  \///@0$refresh ;
               assign \///@0$refresh = FpgaPins_Fpga_CLOCK_TIME_refresh_a0;
               (* keep *) logic  \///@0$reset ;
               assign \///@0$reset = FpgaPins_Fpga_CLOCK_TIME_reset_a0;
               (* keep *) logic  \///@0$show_tens ;
               assign \///@0$show_tens = FpgaPins_Fpga_CLOCK_TIME_show_tens_a0;
               (* keep *) logic [6:0] \///@0$showbits ;
               assign \///@0$showbits = FpgaPins_Fpga_CLOCK_TIME_showbits_a0;
               (* keep *) logic [3:0] \///@0$tens_digit ;
               assign \///@0$tens_digit = FpgaPins_Fpga_CLOCK_TIME_tens_digit_a0;
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 181 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 184 as: m5+board(/top, /fpga, 7, $, , calc)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 47   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+calc.
               //_|clock_time
                  //_@0
                     assign FpgaPins_Fpga_CLOCK_TIME_reset_a0 = reset || ui_in[7];
            
                     // ======================================================
                     // cycounter = cycle count. If 20khz, then it will count
                     // 20000 cycles per second.
                     // ======================================================
            
                     assign FpgaPins_Fpga_CLOCK_TIME_cycounter_a0[24:0] =
                        (FpgaPins_Fpga_CLOCK_TIME_reset_a0 || FpgaPins_Fpga_CLOCK_TIME_cycounter_a1 == 25'd20000000 - 25'd1) ? 25'b0 :
                         FpgaPins_Fpga_CLOCK_TIME_cycounter_a1 + 1;
            
                     // $pulse = signal we set to pulse once per second
                     assign FpgaPins_Fpga_CLOCK_TIME_pulse_a0 = (FpgaPins_Fpga_CLOCK_TIME_cycounter_a0 == 25'd20000000 - 24'd1);
            
            
                     // $refresh = LED frequency of switching
                     assign FpgaPins_Fpga_CLOCK_TIME_refresh_a0 = FpgaPins_Fpga_CLOCK_TIME_cycounter_a0[7] ? 1'b0 :
                                1'b1;
            
                     assign FpgaPins_Fpga_CLOCK_TIME_ones_digit_a0[3:0] = (FpgaPins_Fpga_CLOCK_TIME_reset_a0) ? 4'b0:
                                         !FpgaPins_Fpga_CLOCK_TIME_pulse_a0 ? FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1 :
                                        (FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1 == 4'b1001) ? 4'b0 :
                                        FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1 + 1;
            
                     assign FpgaPins_Fpga_CLOCK_TIME_tens_digit_a0[3:0] = (FpgaPins_Fpga_CLOCK_TIME_reset_a0) ? 4'b0 :
                                        !FpgaPins_Fpga_CLOCK_TIME_pulse_a0 ? FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1 :
                                        (FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1 == 4'b0101 && FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1 == 4'b1001) ? 4'b0 :
                                        (FpgaPins_Fpga_CLOCK_TIME_ones_digit_a1 == 4'b1001) ? FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1 + 1 :
                                        FpgaPins_Fpga_CLOCK_TIME_tens_digit_a1;
            
                     assign FpgaPins_Fpga_CLOCK_TIME_show_tens_a0 = (FpgaPins_Fpga_CLOCK_TIME_reset_a0)  ? 1'b0 :
                                   FpgaPins_Fpga_CLOCK_TIME_refresh_a0 ? !FpgaPins_Fpga_CLOCK_TIME_show_tens_a1 :
                                              FpgaPins_Fpga_CLOCK_TIME_show_tens_a1;
            
            
                     assign FpgaPins_Fpga_CLOCK_TIME_digit_a0[3:0] = FpgaPins_Fpga_CLOCK_TIME_show_tens_a0 ? FpgaPins_Fpga_CLOCK_TIME_tens_digit_a0:
                                                FpgaPins_Fpga_CLOCK_TIME_ones_digit_a0;
            
                     assign uo_out[7] = FpgaPins_Fpga_CLOCK_TIME_show_tens_a0;
            
                     assign FpgaPins_Fpga_CLOCK_TIME_showbits_a0[6:0] =
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h00) ? 7'b0111111 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h01) ? 7'b0000110 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h02) ? 7'b1011011 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h03) ? 7'b1001111 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h04) ? 7'b1100110 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h05) ? 7'b1101101 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h06) ? 7'b1111101 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h07) ? 7'b0000111 :
                        (FpgaPins_Fpga_CLOCK_TIME_digit_a0 == 4'h08) ? 7'b1111111 :
                        7'b1100111 ;
            
                     assign uo_out[6:0] = FpgaPins_Fpga_CLOCK_TIME_showbits_a0[6:0];
            
               // Note that pipesignals assigned here can be found under /fpga_pins/fpga.
            
            
            
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               //*uo_out = 8'b0;
               
               
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 186 as: m5+tt_input_labels_viz(⌈"Value[0]", "Value[1]", "Value[2]", "Value[3]", "Op[0]", "Op[1]", "Op[2]", "="⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source

//_\SV
endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
