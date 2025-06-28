function comparar_filtros(x, fs, tipo, fc)
    ordem = 50; % FIR

    % Filtro FIR
    if strcmp(tipo, 'low') || strcmp(tipo, 'high')
        Wn = fc / (fs/2);
    elseif strcmp(tipo, 'bandpass')
        Wn = fc / (fs/2); % fc é vetor [f1 f2]
    end

    b_fir = fir1(ordem, Wn, tipo);
    x_fir = filter(b_fir, 1, x);

    % Filtro IIR
    [b_iir, a_iir] = butter(6, Wn, tipo);
    x_iir = filter(b_iir, a_iir, x);

    % Reproduzir ambos
    disp('Som original...');
    sound(x, fs); pause(9);
    disp('Som com filtro FIR...');
    sound(x_fir, fs); pause(9);
    disp('Som com filtro IIR...');
    sound(x_iir, fs); pause(9);

    % Mostrar FFTs
    figure;
    subplot(3,1,1);
    plot_fft(x, fs, 'Original');

    subplot(3,1,2);
    plot_fft(x_fir, fs, 'FIR');

    subplot(3,1,3);
    plot_fft(x_iir, fs, 'IIR');

    % Mostrar no tempo também
    t = (0:length(x)-1)/fs;
    figure;
    subplot(3,1,1); plot(t, x); title('Original');
    subplot(3,1,2); plot(t, x_fir); title('FIR');
    subplot(3,1,3); plot(t, x_iir); title('IIR');
end
