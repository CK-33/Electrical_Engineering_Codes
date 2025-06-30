function comparar_janelas(x, fs)
    % Compara o efeito de uma janela retangular vs. Hamming no espectro.
    
    % Cria as janelas
    win_rect = ones(size(x)); % Janela Retangular
    win_hamm = hamming(length(x)); % Janela Hamming

    % Aplica as janelas
    x_rect = x .* win_rect;
    x_hamm = x .* win_hamm;

    % --- Visualização ---
    N_zoom = 400; % Zoom para ver o início e o fim do sinal
    if N_zoom * 2 > length(x)
        N_zoom = floor(length(x)/2);
    end
    t = (0:length(x)-1) / fs;

    fig = figure('Visible', 'off', 'Units', 'normalized', 'Position', [0.1 0.1 0.70 0.70]);
    tl = tiledlayout(2, 2, 'TileSpacing', 'tight', 'Padding', 'compact');
    title(tl, 'Comparação de Janela Retangular vs. Hamming', 'FontSize', 14, 'FontWeight', 'bold');
    
    % Gráficos da Janela Retangular
    ax1 = nexttile;
    plot(ax1, t, x_rect);
    title(ax1, 'Sinal com Janela Retangular');
    ylabel(ax1, 'Amplitude'); xlabel(ax1, 'Tempo (s)'); grid on;

    ax2 = nexttile;
    plot_fft_em_eixo(ax2, x_rect, fs);
    title(ax2, 'Espectro com Janela Retangular');
    
    % Gráficos da Janela Hamming
    ax3 = nexttile;
    plot(ax3, t, x_hamm);
    title(ax3, 'Sinal com Janela Hamming');
    ylabel(ax3, 'Amplitude'); xlabel(ax3, 'Tempo (s)'); grid on;
    
    ax4 = nexttile;
    plot_fft_em_eixo(ax4, x_hamm, fs);
    title(ax4, 'Espectro com Janela Hamming');

    %disp(' '); % Apenas para pular uma linha
    % disp('--> O gráfico está sendo exibido. Pressione qualquer tecla para salvar e fechar.');
    % pause;

    % --- Exportar Imagem ---
    filepath = fullfile('images', 'ComparacaoJanelas.png');
    print(fig, filepath, '-dpng', '-r300');
    close(fig);
    disp(['Arquivo salvo em: ' filepath]);
end