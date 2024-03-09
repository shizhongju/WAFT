# WAFT
This file is centered around the Weighted Affine Fourier Transform (WAFT). The `WAFT.m` (a function) script offers the source code necessary for generating a WAFT signal. This signal is particularly valuable for simulating communication systems.

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
- `signal_in`: The mapped signal (e.g., QPSK, BPSK) which is a matrix with a column length equal to `fft_length`.  

**Output:**  
- `WAFT_signal_out`: The modulated signal, a matrix whose size is `fft_length`*N, where N is the number of WAFT symbols.
