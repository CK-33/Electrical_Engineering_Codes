function plot_and_save_spectrum(x, fs, filename, titulo)
    % Plota o espectro de frequência do sinal e salva a imagem.
    fig = figure('Visible', 'on');
    ax = axes(fig); % Cria um eixo na figura
    
    % 1. Chama a nova função para desenhar o gráfico preparado para o gradiente
    plot_fft_em_eixo(ax, x, fs);
    title(ax, titulo);
    
    % 2. Define o nosso mapa de cores personalizado
    red = [1 0 0]; white = [1 1 1]; blue = [0 0.5 1];
    N = 256;
    mapa_de_cores = [linspace(red(1), white(1), N/2)', linspace(red(2), white(2), N/2)', linspace(red(3), white(3), N/2)'; ...
                     linspace(white(1), blue(1), N/2)', linspace(white(2), blue(2), N/2)', linspace(white(3), blue(3), N/2)'];
    
    % 3. Aplica o mapa de cores ao eixo do gráfico
    colormap(ax, mapa_de_cores);
    
    % Adiciona uma barra de cores para referência (opcional, mas bom para o relatório)
    colorbar(ax);
    
    % Pausa para visualização
    %disp('--> O gráfico colorido está sendo exibido. Pressione qualquer tecla para salvar e fechar.');
    %pause;
    
    filepath = fullfile('images', [filename '.png']);
    saveas(fig, filepath);
    close(fig);
    disp(['Arquivo salvo em: ' filepath]);
end