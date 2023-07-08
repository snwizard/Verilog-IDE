module fifo_single_clk(buf_out,buf_empty,buf_full,fifo_counter,buf_in,rd_en,wr_en,clk,rst);

    parameter FIFO_DEPTH = 64;
    parameter FIFO_WIDTH = 8;
    parameter FIFO_CTR_BITS = $clog2(FIFO_DEPTH); 

    output reg [FIFO_WIDTH-1:0] buf_out;
    output reg buf_empty,buf_full;
    output reg [FIFO_CTR_BITS-1:0] fifo_counter;

    input clk,rst;
    input [FIFO_WIDTH-1:0] buf_in;
    input rd_en,wr_en;

    reg [FIFO_CTR_BITS-1:0] rd_ptr, wr_ptr;
    reg [FIFO_WIDTH-1:0] buf_mem[FIFO_DEPTH-1:0];

    //flag update
    always@(fifo_counter) begin
        buf_empty <= (fifo_counter == 0);
        buf_full  <= (fifo_counter == FIFO_DEPTH);
    end

    //fifo_counter update
    always@(posedge clk, posedge rst) begin
        if(rst)
            fifo_counter <= 0;
        else if(!buf_empty && rd_en)
            fifo_counter <= fifo_counter-1;
        else if(!buf_full && wr_en)
            fifo_counter <= fifo_counter+1;
        else if((!buf_empty && rd_en) && (!buf_full && wr_en))
            fifo_counter <= fifo_counter;
        else
            fifo_counter <= fifo_counter;
    end

    //fifo read
    always@(posedge clk, posedge rst)begin
        if(rst)
            buf_out <= 0;
        else if(!buf_empty && rd_en)
            buf_out <= buf_mem[rd_ptr];
        else
            buf_out <= buf_out;
    end

    //fifo wr
    always@(posedge clk)begin
        if(!buf_full && wr_en)
            buf_mem[wr_ptr] <= buf_in;
        else
            buf_mem[wr_ptr] <= buf_mem[wr_ptr];
    end

    //rd_ptr update
    always@(posedge clk, posedge rst) begin
        if(rst)
            rd_ptr <= 0;
        else if (!buf_empty && rd_en)
            rd_ptr <= rd_ptr+1;
        else    
            rd_ptr <= rd_ptr;
    end

    //wr_ptr update
    always @(posedge clk, posedge rst) begin
        if(rst)
            wr_ptr <= 0;
        else if(!buf_full && wr_en)
            wr_ptr <= wr_ptr+1;
        else    
            wr_ptr <= wr_ptr;
    end


endmodule
