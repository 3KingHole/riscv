RISCV

register <- wr_data(registers) <- Wr_reg_data_id_i(id_stage) <- Wr_reg_data_wb_o(wb_stage) <- U_type?Wr_reg_data1:Wr_reg_data2(wb_stage) 

Wr_reg_data1 <- lui?imme_wb_i:pc_jump_wb_i(wb_stage) [U_type]

imme_wb <- imme_ex_o(ex_stage) <- imme_id_o(id_stage)直接指令解码得到 [lui]

pc_jump_wb_i <- pc_jump_o(ex_stage) <- pc_ex_i + imme_ex_i(ex_stage)

Wr_reg_data2 <- (jal or jalr)?pc_order_wb_i:WB_data(wb_stage) 

WB_data <- MemtoReg?loaddata_wb_i:ALU_result_wb_i