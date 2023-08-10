module NSL(
    input [3:0] CurrentState, 
    input [9:0] SW,
    input [1:0] KEY,
    output reg [3:0] NextState,
    output reg reset_counter
);
parameter Idle = 4'b0000;   //0
parameter Hazard = 4'b0001; //1
parameter Turn = 4'b0010;   //2
parameter Brake = 4'b0011;  //3 
parameter Right = 4'b0100;  //4
parameter Left = 4'b0101;   //5

parameter B_Right = 4'b0110;//6
parameter B_Left = 4'b0111; //7

always@(*)
begin
    reset_counter = 1;
    case(CurrentState)
        Idle :begin
            if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end    
        end 
        Hazard:begin
             if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end  
        end
        Left : begin
              if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                end
            end
            else begin
                NextState = Idle;
            end 
        end
        Right: begin
                if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end
        end
        B_Right: begin
             if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end  
        end
        B_Left :begin
            if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end   
        end 
        Brake : begin
             if (SW[0] == 1) begin
                NextState = Hazard;
            end
              else if (SW[2] == 1) begin
                
                if (SW[1] == 1) begin
                     if (KEY[1] == 0) begin
                    NextState = B_Right;
                    reset_counter = 0;
                    end
                    else if(KEY[1]== 1) begin
                    NextState =B_Left;
                    reset_counter = 0;
                    end
                end
                else begin
                    NextState = Brake;
                end
            end
            else if (SW[1] == 1) begin
                
                if (KEY[1] == 0) begin
                    NextState = Right;
                    reset_counter = 0;
                end
                else if(KEY[1]== 1) begin
                    NextState = Left;
                    reset_counter = 0;
                end
            end
            else begin
                NextState = Idle;
            end  
        end
        default: NextState = Idle;
    endcase
    
    
    end



endmodule