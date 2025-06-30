function comparar_filtros(x, fs, tipo, fc)
    % Parâmetros dos filtros
    ordem = 50;
    Wn = fc/(fs/2); % Frequência de corte normalizada

    % Filtro FIR
    disp('Aplicando filtros FIR e IIR...');
    b_fir = fir1(ordem, Wn, tipo);
    x_fir = filter(b_fir, 1, x);

    % Filtro IIR (Butterworth)
    [b_iir, a_iir] = butter(6, Wn, tipo);
    x_iir = filter(b_iir, a_iir, x);
    disp('Filtros aplicados.');

    % --- MELHORIAS NA VISUALIZAÇÃO ---
    N_zoom = 800; % Ajuste este valor conforme necessário
    if N_zoom > length(x)
        N_zoom = length(x);
    end
    t_zoom = (0:N_zoom-1) / fs; % Eixo do tempo para o zoom

    fig = figure('Visible', 'off', 'Units', 'normalized', 'Position', [0.05 0.05 0.8 0.8]);
    tl = tiledlayout(3, 2, 'TileSpacing', 'compact', 'Padding', 'compact');
    title(tl, ['Comparação de Filtros Passa-', upper(tipo(1)), tipo(2:end), ' (Fc = ', num2str(fc), ' Hz)'], 'FontSize', 14);


    % --- GRÁFICOS DO SINAL ORIGINAL ---
    % Gráfico no Tempo (com zoom)
    ax1 = nexttile;
    plot(ax1, t_zoom, x(1:N_zoom), 'LineWidth', 1.2);
    title(ax1, ['Original - Tempo (Zoom ', num2str(N_zoom), ' amostras)']);
    xlabel(ax1, 'Tempo (s)');
    ylabel(ax1, 'Amplitude');
    grid(ax1, 'on');

    % Gráfico no Espectro (FFT)
    ax2 = nexttile; % Captura o handle do eixo
    plot_fft_em_eixo(ax2, x, fs); % Passa o handle como primeiro argumento
    title(ax2, 'Original - FFT');


    % --- GRÁFICOS DO SINAL FILTRADO (FIR) ---
    % Gráfico no Tempo (com zoom)
    ax3 = nexttile;
    plot(ax3, t_zoom, x_fir(1:N_zoom), 'LineWidth', 1.2);
    title(ax3, 'FIR - Tempo (Zoom)');
    xlabel(ax3, 'Tempo (s)');
    ylabel(ax3, 'Amplitude');
    grid(ax3, 'on');

    % Gráfico no Espectro (FFT)
    ax4 = nexttile; % Captura o handle do eixo
    plot_fft_em_eixo(ax4, x_fir, fs); % Passa o handle como primeiro argumento
    title(ax4, 'FIR - FFT');


    % --- GRÁFICOS DO SINAL FILTRADO (IIR) ---
    % Gráfico no Tempo (com zoom)
    ax5 = nexttile;
    plot(ax5, t_zoom, x_iir(1:N_zoom), 'LineWidth', 1.2);
    title(ax5, 'IIR - Tempo (Zoom)');
    xlabel(ax5, 'Tempo (s)');
    ylabel(ax5, 'Amplitude');
    grid(ax5, 'on');

    % Gráfico no Espectro (FFT)
    ax6 = nexttile; % Captura o handle do eixo
    plot_fft_em_eixo(ax6, x_iir, fs); % Passa o handle como primeiro argumento
    title(ax6, 'IIR - FFT');
    
    % disp(' '); % Apenas para pular uma linha
    % disp('--> O gráfico está sendo exibido. Pressione qualquer tecla para salvar e fechar.');
    % pause;

    % --- EXPORTAR A IMAGEM ---
    filepath = fullfile('images', ['CompareFiltros_' tipo '_' num2str(fc) '.png']);
    print(fig, filepath, '-dpng', '-r300');
    close(fig);
    % Adiciona feedback ao usuário no console
    disp(['Arquivo de comparação de filtros salvo em: ' filepath]);
    while true
        disp('--- QUAL ÁUDIO VOCÊ DESEJA OUVIR? ---');
        disp('1. Áudio Original');
        disp('2. Áudio com Filtro FIR');
        disp('3. Áudio com Filtro IIR');
        disp('4. Voltar ao menu principal');
        
        try
            escolha_audio = input('Escolha uma opção: ');
        catch
            disp('Entrada inválida.');
            continue;
        end

        switch escolha_audio
            case 1
                disp('Reproduzindo áudio Original...');
                sound(normalizar_audio(x), fs);
                disp('Reprodução concluída.');
            case 2
                disp('Reproduzindo áudio com filtro FIR...');
                sound(normalizar_audio(x_fir), fs);
                disp('Reprodução concluída.');
            case 3
                disp('Reproduzindo áudio com filtro IIR...');
                sound(normalizar_audio(x_iir), fs);
                disp('Reprodução concluída.');
            case 4
                disp('Retornando ao menu principal...');
                break; % Sai do loop do menu de áudio
            otherwise
                disp('Opção inválida!');
        end
        disp(' ');
    end
end