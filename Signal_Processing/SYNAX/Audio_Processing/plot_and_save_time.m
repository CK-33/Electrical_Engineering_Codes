function plot_and_save_time(x, fs, filename, titulo)
    % Plota o sinal completo no tempo e salva a imagem.
    fig = figure('Visible', 'on');
    t = (0:length(x)-1)/fs;
    plot(t, x);
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    title(titulo);
    grid on;
    
    disp(' '); % Apenas para pular uma linha
    disp('--> O gráfico está sendo exibido. Pressione qualquer tecla para salvar e fechar.');
    % pause;
    
    filepath = fullfile('images', [filename '.png']);
    saveas(fig, filepath);
    close(fig);
    disp(['Arquivo salvo em: ' filepath]);
end