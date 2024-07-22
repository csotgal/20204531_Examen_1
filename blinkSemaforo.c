#include <stdint.h>

void delay(uint32_t seg) // Contador para simular tiempo en "segundos"
{
    for (uint32_t i = 0; i < seg * 100000; i++);
}

int main(void)
{
    // BASE  GPIO_PORTC = 0x40011000
    // GPIOC_CRH = BASE + OFFSET = 0x40011000 + 0X04

    // BASE RCC = 0x4002 1000
    // RCC_APB2ENR = BASE + 0x18 = 0x40021018
    // GPIOC_CRH = 0x40011004
    // GPIOC_ODR = 0x4001100C

    uint32_t *clk_reg = (uint32_t *)0x40021018;
    uint32_t *puertoc_crh = (uint32_t *)0x40011004;
    uint32_t *puertoc_odr = (uint32_t *)0x4001100C;

    *clk_reg |= (1 << 4);       // Activa el reloj del puerto C
    *puertoc_crh &= 0x000FFFFF; // Modo de salida push-pull para pC13, pC14, pC15
    *puertoc_crh |= 0x22200000; // Modo de operación "10" para pC13, pC14, pC15
    *puertoc_odr |= 0x00000000; // Inicio de todos los pines en 0 "off"

    while (1)
    {
        *puertoc_odr |= 0x00002000; // Configura la salida de pC13 en 1 "on"
        delay(6);                   // Espera "6 segundos"
        *puertoc_odr &= 0xFFFFDFFF; // Configura la salida de pC13 en 0 "off"
        *puertoc_odr |= 0x00004000; // Configura la salida de pC14 en 1 "on"
        delay(2);                   // Espera "2 segundos"
        *puertoc_odr &= 0xFFFFBFFF; // Configura la salida de pC14 en 0 "off"
        *puertoc_odr |= 0x00008000; // Configura la salida de pC15 en 1 "on"
        delay(10);                  // Espera "10 segundos"
        *puertoc_odr &= 0xFFFF7FFF; // Configura la salida de pC15 en 0 "off"
    }

    return 0;
}
