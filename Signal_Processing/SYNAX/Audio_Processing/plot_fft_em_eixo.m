function plot_fft_em_eixo(ax, signal, fs)
    % Calcula e plota o espectro de amplitude, colorindo a linha
    % de acordo com a frequência (graves em vermelho, agudos em azul).
    
    L = length(signal);
    Y = fft(signal);
    
    % Calcula o espectro de amplitude de lado único P1
    P2 = abs(Y/L);
    P1 = P2(1:floor(L/2)+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    % Define o vetor de frequência
    f = fs * (0:floor(L/2)) / L;
    
    % --- CORREÇÃO DEFINITIVA: TRANSFORMAR EM VETORES-LINHA PARA A 'SURFACE' ---
    % A função surface, para desenhar uma linha, espera matrizes 2xN.
    % Primeiro garantimos que são colunas com (:) e depois transpomos para 
    % se tornarem linhas com o apóstrofo (').
    f_row = f(:)';
    P1_row = P1(:)';
    
    % Criar os dados Z (profundidade) e C (cor) com a mesma dimensão (1xN)
    z_row = zeros(size(f_row));
    col_row = f_row; % A cor será baseada na frequência

    % --- PLOTAGEM USANDO SURFACE ---
    % Agora criamos as matrizes 2xN empilhando os vetores-linha, o que é
    % o formato correto esperado pela 'surface' em todas as situações.
    surface(ax, [f_row; f_row], [P1_row; P1_row], [z_row; z_row], [col_row; col_row], ...
        'facecol', 'no', ...
        'edgecol', 'interp', ...
        'linewidth', 1.5);

    % --- CONFIGURAÇÃO DO GRÁFICO ---
    xlabel(ax, 'Frequência (Hz)');
    ylabel(ax, 'Magnitude |P1(f)|');
    grid(ax, 'on');
    view(ax, 2); % Garante que estamos vendo o gráfico em 2D (de cima)
    ax.XLim = [0 fs/2];
end