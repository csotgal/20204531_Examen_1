#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void comparaDivisores(int num, int sumDiv) // Compara el número con su suma de divisores y muestra el mensaje adecuado
{
  if (sumDiv < num)
  {
    printf("%d - Deficiente\n", num);
  }
  else if (sumDiv == num)
  {
    printf("%d - Perfecto\n", num);
  }
  else
  {
    printf("%d - Abundante\n", num);
  }
}

void divisoresArreglo(int arr[], int n)
{
  for (int i = 0; i < n; i++) // Recorre cada número del arreglo
  {
    int sumDiv = 0;
    for (int j = 1; j < arr[i] / 2 + 1; j++) // Para cada número, recorre los números menores desde 1 hasta (número/2 + 1)
    {
      if (arr[i] % j == 0) // Si es un divisor del número, lo suma a sumDiv (suma de divisores)
      {
        sumDiv += j; 
      }
    }
    comparaDivisores(arr[i], sumDiv); // Compara sumDiv con el número
  }
}

int main()
{
  srand(time(NULL)); // Inicialización del generador de números aleatorios
  int lenArr = 15;   // Longitud de arreglo de números aleatorios
  int numeros[lenArr];

  printf("El arreglo es: ");
  for (int i = 0; i < 15; i++)
  {
    numeros[i] = rand() % 100; // Inicializa el arreglo de enteros con números aleatorios del 0 - 99
    printf("%d ", numeros[i]); // Muestra cada número del arreglo, al lado del anterior
  }
  printf("\n\n");

  divisoresArreglo(numeros, lenArr); // Analiza los divisores de los número del arreglo generado

  return 0;
}
