/*-----------------------------------------------*
 *  Title       : AXI Lite GPIO Driver           *
 *  Project     : Custom AXI Lite GPIO           *
 *-----------------------------------------------*
 *  File        : axi_lite_gpio.h                *
 *  Author      : Yigit Suoglu                   *
 *  License     : EUPL-1.2                       *
 *  Last Edit   : 02/11/2021                     *
 *-----------------------------------------------*
 *  Description : SW driver for GPIO module      *
 *-----------------------------------------------*/
#ifndef AXI_LITE_GPIO_H
#define AXI_LITE_GPIO_H

enum port_type : unsigned char {
  input,
  output
};


class axi_gpio{
private:
  unsigned long*  inputs[32];
  unsigned long* outputs[32];
  unsigned char i_count;
  unsigned char o_count;
public:
  axi_gpio(unsigned long input_base, unsigned long output_base, unsigned char input_count, unsigned char output_count, unsigned char addr_increment);
  unsigned long get(port_type port, unsigned short number);
  unsigned long get(unsigned short number);
  bool set(unsigned short number, unsigned long data);
};

#endif // AXI_LITE_GPIO_H
