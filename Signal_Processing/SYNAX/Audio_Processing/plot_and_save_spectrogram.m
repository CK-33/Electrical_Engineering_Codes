function plot_and_save_spectrogram(x, fs, filename, titulo)
    % Plota o espectrograma do sinal e salva a imagem.
    fig = figure('Visible', 'on');
    
    % Parâmetros para o espectrograma
    window_size = 512;
    overlap = round(window_size * 0.75);
    nfft = 1024;
    
    spectrogram(x, hamming(window_size), overlap, nfft, fs, 'yaxis');
    
    title(titulo);

    disp(' '); % Apenas para pular uma linha
    disp('--> O gráfico está sendo exibido. Pressione qualquer tecla para salvar e fechar.');
    % pause;
    
    filepath = fullfile('images', [filename '.png']);
    saveas(fig, filepath);
    close(fig);
    disp(['Arquivo salvo em: ' filepath]);
end