module cdc_synchronizer(
    input clk_dest,
    input async_in,
    output sync_out
 );
    reg sync_ff1 = 0;
    reg sync_ff2 = 0;
    always @(posedge clk_dest) begin
        sync_ff1 <= async_in;
        sync_ff2 <= sync_ff1;
    end
    assign sync_out = sync_ff2;
 endmodule
