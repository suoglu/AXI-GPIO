# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Number_of_Ports [ipgui::add_group $IPINST -name "Number of Ports" -parent ${Page_0} -display_name {Number of IO Ports}]
  set_property tooltip {Edit Number of Ports} ${Number_of_Ports}
  set I_PORT_COUNT [ipgui::add_param $IPINST -name "I_PORT_COUNT" -parent ${Number_of_Ports}]
  set_property tooltip {Input Port Count} ${I_PORT_COUNT}
  set O_PORT_COUNT [ipgui::add_param $IPINST -name "O_PORT_COUNT" -parent ${Number_of_Ports}]
  set_property tooltip {Output Port Count} ${O_PORT_COUNT}

  #Adding Group
  set Offsets [ipgui::add_group $IPINST -name "Offsets" -parent ${Page_0}]
  set_property tooltip {Offsets for first addresses} ${Offsets}
  set GPO_AXI_ADDR_OFFSET [ipgui::add_param $IPINST -name "GPO_AXI_ADDR_OFFSET" -parent ${Offsets}]
  set_property tooltip {Offset for output registers} ${GPO_AXI_ADDR_OFFSET}
  set GPI_AXI_ADDR_OFFSET [ipgui::add_param $IPINST -name "GPI_AXI_ADDR_OFFSET" -parent ${Offsets}]
  set_property tooltip {Offset for inputs} ${GPI_AXI_ADDR_OFFSET}
  ipgui::add_static_text $IPINST -name "Warning!" -parent ${Offsets} -text {Diffrence between offsets must be at least 4 * address pointer diffrence!}
  ipgui::add_static_text $IPINST -name "Default info" -parent ${Offsets} -text {128 for default 32 bit AXI data}

  #Adding Group
  set Address_Information [ipgui::add_group $IPINST -name "Address Information" -parent ${Page_0}]
  set_property tooltip {Non-changable} ${Address_Information}
  set ADDR_INC [ipgui::add_param $IPINST -name "ADDR_INC" -parent ${Address_Information}]
  set_property tooltip {Diffrence between two register next to each other} ${ADDR_INC}



}

proc update_PARAM_VALUE.ADDR_INC { PARAM_VALUE.ADDR_INC } {
	# Procedure called to update ADDR_INC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_INC { PARAM_VALUE.ADDR_INC } {
	# Procedure called to validate ADDR_INC
	return true
}

proc update_PARAM_VALUE.GPI_AXI_ADDR_OFFSET { PARAM_VALUE.GPI_AXI_ADDR_OFFSET } {
	# Procedure called to update GPI_AXI_ADDR_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GPI_AXI_ADDR_OFFSET { PARAM_VALUE.GPI_AXI_ADDR_OFFSET } {
	# Procedure called to validate GPI_AXI_ADDR_OFFSET
	return true
}

proc update_PARAM_VALUE.GPO_AXI_ADDR_OFFSET { PARAM_VALUE.GPO_AXI_ADDR_OFFSET } {
	# Procedure called to update GPO_AXI_ADDR_OFFSET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GPO_AXI_ADDR_OFFSET { PARAM_VALUE.GPO_AXI_ADDR_OFFSET } {
	# Procedure called to validate GPO_AXI_ADDR_OFFSET
	return true
}

proc update_PARAM_VALUE.I_PORT_COUNT { PARAM_VALUE.I_PORT_COUNT } {
	# Procedure called to update I_PORT_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.I_PORT_COUNT { PARAM_VALUE.I_PORT_COUNT } {
	# Procedure called to validate I_PORT_COUNT
	return true
}

proc update_PARAM_VALUE.O_PORT_COUNT { PARAM_VALUE.O_PORT_COUNT } {
	# Procedure called to update O_PORT_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.O_PORT_COUNT { PARAM_VALUE.O_PORT_COUNT } {
	# Procedure called to validate O_PORT_COUNT
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_BASEADDR { PARAM_VALUE.C_S_AXI_BASEADDR } {
	# Procedure called to update C_S_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_BASEADDR { PARAM_VALUE.C_S_AXI_BASEADDR } {
	# Procedure called to validate C_S_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_HIGHADDR { PARAM_VALUE.C_S_AXI_HIGHADDR } {
	# Procedure called to update C_S_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_HIGHADDR { PARAM_VALUE.C_S_AXI_HIGHADDR } {
	# Procedure called to validate C_S_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.I_PORT_COUNT { MODELPARAM_VALUE.I_PORT_COUNT PARAM_VALUE.I_PORT_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.I_PORT_COUNT}] ${MODELPARAM_VALUE.I_PORT_COUNT}
}

proc update_MODELPARAM_VALUE.O_PORT_COUNT { MODELPARAM_VALUE.O_PORT_COUNT PARAM_VALUE.O_PORT_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.O_PORT_COUNT}] ${MODELPARAM_VALUE.O_PORT_COUNT}
}

proc update_MODELPARAM_VALUE.C_S_AXI_BASEADDR { MODELPARAM_VALUE.C_S_AXI_BASEADDR PARAM_VALUE.C_S_AXI_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_BASEADDR}] ${MODELPARAM_VALUE.C_S_AXI_BASEADDR}
}

proc update_MODELPARAM_VALUE.ADDR_INC { MODELPARAM_VALUE.ADDR_INC PARAM_VALUE.ADDR_INC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_INC}] ${MODELPARAM_VALUE.ADDR_INC}
}

proc update_MODELPARAM_VALUE.GPO_AXI_ADDR_OFFSET { MODELPARAM_VALUE.GPO_AXI_ADDR_OFFSET PARAM_VALUE.GPO_AXI_ADDR_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GPO_AXI_ADDR_OFFSET}] ${MODELPARAM_VALUE.GPO_AXI_ADDR_OFFSET}
}

proc update_MODELPARAM_VALUE.GPI_AXI_ADDR_OFFSET { MODELPARAM_VALUE.GPI_AXI_ADDR_OFFSET PARAM_VALUE.GPI_AXI_ADDR_OFFSET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GPI_AXI_ADDR_OFFSET}] ${MODELPARAM_VALUE.GPI_AXI_ADDR_OFFSET}
}

