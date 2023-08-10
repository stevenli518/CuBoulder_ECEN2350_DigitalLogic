module OL(
    input [3:0] CurrentState,
    input [2:0]counter,
    input [2:0] hazard,
    output reg [9:0] LEDR
    
);


parameter Idle = 4'b0000;
parameter Hazard = 4'b0001;


parameter Brake = 4'b0011;

parameter Turn = 4'b0010;
parameter Right = 4'b0100;
parameter Left = 4'b0101;
parameter B_Right = 4'b0110;
parameter B_Left = 4'b0111;



always@(*)begin
    case(CurrentState)
    Idle: LEDR = 10'b0;

    Hazard : begin
        LEDR[9:7]= hazard;
        LEDR[2:0]= hazard;
        LEDR[6:3] = 4'b0;
        
    end
    Left: begin
            LEDR[6:0] = 4'b0;
            if (counter == 1 || counter == 2) begin
                LEDR[9:7] = 3'b001;
            end
            else if (counter == 3 || counter ==4) begin
                LEDR[9:7] = 3'b011;
            end
            else if (counter == 5) begin
                LEDR[9:7] = 3'b111;
            end
            else begin
                LEDR[9:7] =3'b0;
            end
        end
    Right: begin
            LEDR[9:3] = 4'b0;
             if (counter == 1|| counter ==2 ) begin
                LEDR[2:0] = 3'b100;
            end
            else if (counter == 3|| counter ==4 ) begin
                LEDR[2:0] = 3'b110;
            end
            else if (counter == 5) begin
                LEDR[2:0] = 3'b111;
            end
            else begin
                LEDR[2:0]=3'b0;
            end
        end
    B_Left:begin
            LEDR[6:3] = 4'b0;
            if (counter == 1|| counter ==2) begin
                LEDR[9:7] = 3'b001;
                LEDR[2:0] =3'b111;
            end
            else if (counter == 3|| counter ==4) begin
                LEDR[9:7] = 3'b011;
                LEDR[2:0] =3'b111;
            end
            else if (counter == 5) begin
                LEDR[9:7] = 3'b111;
                LEDR[2:0] =3'b111;
            end
            else begin
                LEDR[9:7] =3'b0;
                LEDR[2:0] =3'b111;
            end
        end
    B_Right:begin
            LEDR[6:3] = 4'b0;
            if (counter == 1|| counter ==2) begin
                LEDR[2:0] = 3'b100;
                LEDR[9:7] = 3'b111;
            end
            else if (counter == 3|| counter ==4) begin
                LEDR[2:0] = 3'b110;
                LEDR[9:7] = 3'b111;
            end
            else if (counter == 5) begin
                LEDR[2:0] = 3'b111;
                LEDR[9:7] = 3'b111;
            end
            else begin
                LEDR[2:0]=3'b0;
                LEDR[9:7] = 3'b111;
            end
        end
    
    Brake : LEDR[9:0]=10'b111_0000_111; 

    default: LEDR = 10'b0;
    endcase
end



endmodule
