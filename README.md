# WAFT
This file is centered around the Weighted Affine Fourier Transform (WAFT). The `WAFT.m` (a function) script offers the source code necessary for generating a WAFT signal. This signal is particularly valuable for simulating communication systems. The $`\alpha`$-order represents a positive transform, and the corresponding inverse transform is a negative -$`\alpha`$-order transform.

## Compiler
MATLAB 2021

## Introduction
 `WAFT.m` is a function of generating WAFT symbols.Here is the instructions.

## How to use
y = WAFT(fft_length,alpha,beta,signal_in)
### Parameters introductions

**Inputs:**  
- `fft_length`: The length of one WAFT symbol or the count of subcarriers.  
- `alpha`: The order of the fractional weighted parameter.  
- `beta`: A parameter of the chirp signal used to adjust the WAFT.  
- `signal_in`: The mapped signal (e.g., QPSK, BPSK) which is a matrix with a column length equals to `fft_length`.  

**Output:**  
- `WAFT_signal_out`: The modulated signal, a matrix whose size is `fft_length`*N, where N is the number of WAFT symbols.
## Reference
- L. Mei, X. -j. Sha and N. -t. Zhang, ”The approach to carrier scheme convergence based on 4-weighted fractional fourier transform,” in IEEE Communications Letters, vol. 14, no. 6, pp. 503-505, June 2010.
- Soo-Chang Pei and Jian-Jiun Ding, ”Closed-form discrete fractional and affine Fourier transforms,” in IEEE Transactions on Signal Processing, vol. 48, no. 5, pp. 1338-1353, May 2000.
