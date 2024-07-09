module blinky(
    input wire clk,           // 100MHz clock
    input wire rst_n,         // reset button (active low)
    output wire [7:0] led    // 8 user controllable LEDs
);

    wire rst;                 // reset signal
    wire [7:0] wave_pattern;  // wave pattern output from wave module
    reg [7:0] bugs_pattern = 8'b10101010; // initial pattern for bugs LED display
    reg [26:0] counter;       // counter register for toggling bugs_pattern
    localparam integer COUNT_MAX = 25_000_000; // counter maximum value for timing

    // Instantiate the reset conditioner
    // The reset conditioner ensures a clean reset signal
    reset_conditioner reset_cond (
        .clk(clk),           // clock input
        .in(~rst_n),         // active-low reset input, inverted
        .out(rst)            // conditioned reset output
    );

    // Instantiate the wave module
    // The wave module generates a wave pattern for the LEDs
    wave wave_inst (
        .clk(clk),           // clock input
        .rst(rst),           // reset input
        .out(wave_pattern)   // wave pattern output
    );

    // Counter and pattern toggle logic
    always @(posedge clk) begin
        if (counter == COUNT_MAX) begin
            counter <= 0;       // reset counter when COUNT_MAX is reached
            bugs_pattern <= ~bugs_pattern;  // toggle the bugs pattern
        end else begin
            counter <= counter + 1;     // increment counter
        end
    end
   
    // LED output assignment
    // If reset is active, use bugs_pattern; otherwise, use wave_pattern
    assign led = rst ? bugs_pattern : wave_pattern;

endmodule