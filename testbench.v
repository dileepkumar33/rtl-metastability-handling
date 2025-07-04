module tb_cdc_synchronizer;
    reg clk = 0;
    reg async_in = 0;
    wire sync_out;

    cdc_synchronizer uut (
        .clk_dest(clk),
        .async_in(async_in),
        .sync_out(sync_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cdc_sync.vcd");
        $dumpvars(0, clk, async_in, uut.sync_ff1, uut.sync_ff2, sync_out);

        #10 async_in = 1;
        #20 async_in = 0;
        #30 async_in = 1;
        #40 async_in = 0;
        #20 $finish;
    end
endmodule
