#include <stdint.h>

int main(void)
{
    // Direccion Base GPIO_P0 = 0x50000000
    // GPIOP0_OUT = BASE + OFFSET = 0x50000000 + 0x504 = 0x50000504
    // GPIOP0_OUSET = 0x50000000 + 0x508 = 0x50000508
    // GPIOP0_OUTCLR = 0x50000000 + 0x50C = 0x5000050C
    // GPIOP0_IN = 0x50000000 + 0x510 = 0x50000510
    // GPIOP0_DIR = 0x50000000 + 0x514 = 0x50000514
    // GPIOP0_DIRSET = 0x50000000 + 0x518 = 0x50000518
    // GPIOP0_DIRCLR = 0x50000000 + 0x51C = 0x5000051C


    uint32_t* gpiop0_out = (uint32_t *) 0x50000504;
    uint32_t* gpiop0_outset = (uint32_t *) 0x50000508;
    uint32_t* gpiop0_outclr = (uint32_t *) 0x5000050C;
    uint32_t* gpiop0_in = (uint32_t *) 0x50000510;
    uint32_t* gpiop0_dir = (uint32_t *) 0x50000514;
    uint32_t* gpiop0_dirset = (uint32_t *) 0x50000518;
    uint32_t* gpiop0_dirclr = (uint32_t *) 0x5000051C;
}