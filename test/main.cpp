#include "axi_lite_gpio.h"
#include "xparameters.h"

int main(){
  axi_gpio gpio(
  XPAR_AXI_LITE_GPIO_0_S_AXI_BASEADDR+XPAR_AXI_LITE_GPIO_0_GPI_AXI_ADDR_OFFSET,
  XPAR_AXI_LITE_GPIO_0_S_AXI_BASEADDR+XPAR_AXI_LITE_GPIO_0_GPO_AXI_ADDR_OFFSET,XPAR_AXI_LITE_GPIO_0_I_PORT_COUNT,
  XPAR_AXI_LITE_GPIO_0_O_PORT_COUNT,
  XPAR_AXI_LITE_GPIO_0_ADDR_INC);
  unsigned long* uart_rx = reinterpret_cast<unsigned long*>(XPAR_AXI_UARTLITE_0_BASEADDR);
  unsigned long* uart_tx = reinterpret_cast<unsigned long*>(XPAR_AXI_UARTLITE_0_BASEADDR+4);
  unsigned long* uart_stat = reinterpret_cast<unsigned long*>(XPAR_AXI_UARTLITE_0_BASEADDR+8);
  bool read;
  bool fromRead;
  unsigned char addrs;
  while(true){
    while((*uart_stat & 0x1) == 0x0);
    unsigned long buff = *uart_rx;
    if (buff == 0x0){
      read = true;
      fromRead = true;
    }else if(buff == 0x1){
      read = true;
      fromRead = false;
    }else if(buff == 0x2){
      read = false;
    }
    while((*uart_stat & 0x1) == 0x0);
    addrs = *uart_rx;
    if(!read){
      while((*uart_stat & 0x1) == 0x0);
      unsigned char data = *uart_rx;
      gpio.set(addrs, data);
    }else if(fromRead){
      *uart_tx = gpio.get(input, addrs);
    }else{
      *uart_tx = gpio.get(output, addrs);
    }
  }
  return 0;
}
