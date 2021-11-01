/*-----------------------------------------------*
 *  Title       : AXI Lite GPIO Driver           *
 *  Project     : Custom AXI Lite GPIO           *
 *-----------------------------------------------*
 *  File        : axi_lite_gpio.cpp              *
 *  Author      : Yigit Suoglu                   *
 *  License     : EUPL-1.2                       *
 *  Last Edit   : 02/11/2021                     *
 *-----------------------------------------------*
 *  Description : SW driver for GPIO module      *
 *-----------------------------------------------*/
#include "axi_lite_gpio.h"

axi_gpio::axi_gpio(unsigned long input_base,
           unsigned long output_base,
           unsigned char input_count,
           unsigned char output_count,
           unsigned char addr_increment):
           i_count(input_count),
           o_count(output_count){
  unsigned long nextAddrs = input_base;
  for(unsigned short i = 0; i < 32; i++){
    inputs[i] = (input_count > i) ? reinterpret_cast<unsigned long*>(nextAddrs) : nullptr;
    nextAddrs+=addr_increment;
  }
  nextAddrs = output_base;
  for(unsigned short i = 0; i < 32; i++){
    outputs[i] = (output_count > i) ? reinterpret_cast<unsigned long*>(nextAddrs) : nullptr;
    nextAddrs+=addr_increment;
  }
}

unsigned long axi_gpio::get(port_type port, unsigned short number){
  if(port == input){
    if(number < i_count){
      return *inputs[number];
    }else{
      return 0xDEC0DEE5;
    }
  }else{
    if(number < o_count){
      return *outputs[number];
    }else{
      return 0xDEC0DEE5;
    }
  }
}

unsigned long axi_gpio::get(unsigned short number){
  if(number < i_count){
    return *inputs[number];
  }else{
    return 0xDEC0DEE5;
  }
}

bool axi_gpio::set(unsigned short number, unsigned long data){
  if(number < o_count){
    *outputs[number] = data;
    return true;
  }else{
    return false;
  }
}
