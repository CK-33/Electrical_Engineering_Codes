clear; clc;

% Carregar áudio uma vez
[x, fs] = audioread('voz.wav');
x = x(:,1); % Mono
t = (0:length(x)-1)/fs;

while true
    disp('--- PROCESSAMENTO DE ÁUDIO ---');
    disp('1. Reproduzir áudio original');
    disp('2. Visualizar domínio do tempo');
    disp('3. Visualizar domínio da frequência');
    disp('4. Filtro passa-baixa (IIR vs FIR)');
    disp('5. Filtro passa-alta (IIR vs FIR)');
    disp('6. Filtro passa-faixa (IIR vs FIR)');
    disp('7. Sair');

    opcao = input('Escolha uma opção: ');

    switch opcao
        case 1
            sound(x, fs);

        case 2
            plot_sinal_tempo(t, x);

        case 3
            plot_fft(x, fs, 'FFT - Áudio Original');

        case 4
            comparar_filtros(x, fs, 'low', 1000);

        case 5
            comparar_filtros(x, fs, 'high', 3000);

        case 6
            comparar_filtros(x, fs, 'bandpass', [1000 3000]);

        case 7
            break;

        otherwise
            disp('Opção inválida!');
    end

    disp(' ');
end
