#include<stdio.h>
#include<math.h>
#include"system.h"
#include"io.h"
#include"altera_avalon_pio_regs.h"
#define pi 3.142857
const int m = 8,
 n = 8;
 // Function to find discrete cosine transform and print it
 int dctTransform(int matrix[m] [n], int Qmatrix[n] [n])
 {
  int i, j, k, l;
  int dct[m][n];
  int Qdct[m][n];
  float ci, cj, dct1, sum;
  for (i = 0; i < m; i++) {
    for (j = 0; j < n; j++) {
      // ci and cj depends on frequency as well as
      // number of row and columns of specified matrix
      if (i == 0)
        ci = 1 / sqrt(m);
      else
        ci = sqrt(2) / sqrt(m);
      if (j == 0)
        cj = 1 / sqrt(n);
      else
        cj = sqrt(2) / sqrt(n);
      // sum will temporarily store the sum of
      // cosine signals
      sum = 0;
      for (k = 0; k < m; k++) {
        for (l = 0; l < n; l++) {
          matrix[k][l] = matrix[k][l] - 128;
          dct1 = matrix[k][l] *cos((2 * k + 1) * i * pi / (2 * m)) * cos((2 * l + 1) * j * pi / (2 * n));
          sum = sum + dct1;
          //printf("%d\t", sum);
        }
      }
      Qdct[i][j] = ci * cj * sum;
      dct[i][j] = Qdct[i][j] / Qmatrix[i][j];
      // printf("%d\t", Qdct[i][j]);
    }
  }
    for (i = 0; i < m; i++) {
      for (j = 0; j < n; j++) {
        printf("%d\t",dct[i][j]);
        }
	printf("\n");
        
    }
    return 0;
  }
int main()
{
  int matrix[8][8];/*{ { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 },
            { 255, 255, 255, 255, 255, 255, 255, 255 } };*/

  int Qmatrix[8][8] = { { 16, 11, 10, 16, 24, 40, 51, 61 },
            { 12, 12, 14, 19, 26, 58, 60, 55 },
            { 14, 13, 16, 24, 40, 57, 69, 56 },
            { 14, 17, 22, 29, 51, 87, 80, 62 },
            { 18, 22, 37, 56, 68, 109, 103, 77 },
            { 24, 35, 55, 64, 81, 104, 113, 92 },
            { 49, 64, 78, 87, 103, 121, 120, 101 },
            { 72, 92, 95, 98, 112, 100, 103, 99 } };
  int temp;
  int t, r;

  for(t = 0; t < 8; t++)
  {
   for(r = 0; r < 8; r++)
   {

     if(t == 0 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE1_1_BASE, r);
     }
     if(t == 0 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE1_2_BASE, r-4);
     }
     if(t == 1 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE2_1_BASE, r);
     }
     if(t == 1 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE2_2_BASE, r-4);
     }
     if(t == 2 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE3_1_BASE, r);
     }
     if(t == 2 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE3_2_BASE, r-4);
     }
     if(t == 3 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE4_1_BASE, r);
     }
     if(t == 3 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE4_2_BASE, r-4);
     }
     if(t == 4 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE5_1_BASE, r);
     }
     if(t == 4 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE5_2_BASE, r-4);
     }
     if(t == 5 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE6_1_BASE, r);
     }
     if(t == 5 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE6_2_BASE, r-4);
     }
     if(t == 6 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE7_1_BASE, r);
     }
     if(t == 6 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE7_2_BASE, r-4);
     }
     if(t == 7 && r < 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE8_1_BASE, r);
     }
     if(t == 7 && r >= 4)
     {
       matrix[t][r] =IORD_8DIRECT(LINE8_2_BASE, r-4);
     }
   }
  }

  dctTransform(matrix, Qmatrix);
return 0;
}














