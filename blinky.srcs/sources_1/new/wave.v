module wave #(
    parameter CTR_LEN = 25 // Counter length parameter, default is 25
)(
    input clk,          // Clock input
    input rst,          // Reset input
    output reg [7:0] out // 8-bit LED output
);

    // Counter register
    reg [CTR_LEN-1:0] ctr; // Main counter register

    // Intermediate signals
    reg [8:0] result; // Intermediate result register for calculations
    reg [7:0] acmp;   // Intermediate register for comparison

    integer i; // Loop index variable

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ctr <= 0; // Reset counter to 0
        end else begin
            ctr <= ctr + 1; // Increment counter by 1 on each clock cycle
        end
    end

    // LED wave pattern logic
    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin
            // Take the top bits of the counter and offset them differently for each output
            result = ctr[CTR_LEN-1 -: 9] + (i * 8'd64); 
            // Extract 9 bits starting from the CTR_LEN-1 position and add an offset (i * 64)

            // If the MSB is 1, invert the result to count down
            if (result[8]) // Check if the MSB of the result is 1
                acmp = ~result[7:0]; // If MSB is 1, invert the lower 8 bits of the result
            else
                acmp = result[7:0]; // If MSB is 0, take the lower 8 bits as they are

            // PWM output
            out[i] = (acmp > ctr[7:0]); // Compare the modified result with the lower 8 bits of the counter
        end
    end

endmodule