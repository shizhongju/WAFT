function WAFT_signal_out = WAFT(fft_length,alpha,beta,signal_in)
% % This function is aimed at acquiring WAFT signal by the given parameters.
% % Inputs:
% % fft_length       -The length of one WAFT symbol or subcarrier counts.
% % alpha            -The order of fractional weighted parameter
% % beta             -A parameter of chirp signal to adjust WAFT.
% % signal_in        -Mapped signal such as QPSK,BPSK ...,and it's a matrix
% %                   whose length is fft_length in column.
% % Output:
% % WAFT_signal_out  -Modulated signal and it's a matrix whose length is fft_length in column.
%  wl(alpha) = cos((alpha-l)*pi/4).*cos(2*(alpha-l)*pi/4).*exp(3*(alpha-l)*pi*1i/4);which is the weight coefficient for the corresponding function
%%      p_matrix : permutation matrix .F^2=p_matrix;
        p_matrix = zeros(fft_length,fft_length);  
        temp = [1 zeros(1,fft_length-1)];
        p_matrix(1,:) = temp;
        for i=1:fft_length-1
            p_matrix(i+1,:) = circshift(temp,-i);
        end
w0 = cos((alpha-0)*pi/4).*cos(2*(alpha-0)*pi/4).*exp(3*(alpha-0)*pi*1i/4);
w1 = cos((alpha-1)*pi/4).*cos(2*(alpha-1)*pi/4).*exp(3*(alpha-1)*pi*1i/4);
w2 = cos((alpha-2)*pi/4).*cos(2*(alpha-2)*pi/4).*exp(3*(alpha-2)*pi*1i/4);
w3 = cos((alpha-3)*pi/4).*cos(2*(alpha-3)*pi/4).*exp(3*(alpha-3)*pi*1i/4);
F = dftmtx(N)/sqrt(N);  % normalized discrete Fourier transform matrix"

%% conculate the Lambda matrix
Lambda_mtx = zeros(fft_length,fft_length);
i = 0:fft_length-1; 
Lambda_mtx = diag(exp(-1j*2*pi*beta*i.^2));
%% acquire WAFT signal   WAFT_matrix = Lambda_mtx'*(w0*eye(fft_length) + w1*F + w2*p_matrix + w3*p_matrix*F)*Lambda_mtx;
WAFT_signal_out = w0*signal_in+w1*Lambda_mtx'*fft(Lambda_mtx*signal_in,fft_length,1) + w2*Lambda_mtx'*p_matrix*Lambda_mtx*...
signal_in + w3*Lambda_mtx'*p_matrix*fft(Lambda_mtx*signal_in,fft_length,1);

end
