

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "axi_lite_gpio" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_BASEADDR" "C_S_AXI_HIGHADDR" "I_PORT_COUNT" "O_PORT_COUNT" "GPO_AXI_ADDR_OFFSET" "GPI_AXI_ADDR_OFFSET" "GPO_AXI_ADDR_START" "GPI_AXI_ADDR_START" "ADDR_INC"
}
