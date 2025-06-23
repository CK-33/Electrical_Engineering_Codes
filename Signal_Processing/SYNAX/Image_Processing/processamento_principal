function processamento_imagem()
  % Carrega a imagem
  [nome_arquivo, caminho_arquivo] = uigetfile({'*.jpg;*.png;*.bmp', 'Arquivos de Imagem (*.jpg, *.png, *.bmp)'}, 'Selecione a imagem');
  if isequal(nome_arquivo, 0)
    disp('Nenhuma imagem selecionada.');
    return;
  end
  caminho_completo = fullfile(caminho_arquivo, nome_arquivo);
  imagem_original = imread(caminho_completo);

  % Exibe a imagem original
  figure;
  imshow(imagem_original);
  title('Imagem Original');

  % Chama o menu de processamento diretamente
  menu_processamento(imagem_original);
end

% --- Funções do Menu e Processamento ---

function menu_processamento(imagem_original)
  disp('---');
  disp('Selecione o processamento:');
  disp('1. Escala de cinza');
  disp('2. Filtro passa-baixa (Filtro da Média)');
  disp('3. Filtro passa-alta (Filtro Laplaciano)');
  disp('4. Transformada de Fourier (Espectro de Magnitude)');
  disp('5. Realce de Contraste (Histogram Equalization)');
  disp('6. Detecção de Bordas (Canny)');
  disp('7. Redução de Ruído (Filtro de Mediana)');
  disp('8. Redimensionar Imagem');
  disp('9. Transformada Coseno Discreta (DCT)');
  disp('10. Sair');
  disp('---');

  opcao = input('Opção: ');

  switch opcao
    case 1
      imagem_processada = escala_cinza(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem em Escala de Cinza');
    case 2
      imagem_processada = filtro_passa_baixa_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem com Filtro Passa-Baixa (Média)');
    case 3
      imagem_processada = filtro_passa_alta_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem com Filtro Passa-Alta (Laplaciano)');
    case 4
      transformada_fourier_imagem(imagem_original); % Esta função já exibe a imagem
    case 5
      imagem_processada = realce_contraste_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem com Realce de Contraste');
    case 6
      imagem_processada = deteccao_bordas_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem com Bordas Detectadas (Canny)');
    case 7
      imagem_processada = reducao_ruido_mediana_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem com Ruído Reduzido (Filtro de Mediana)');
    case 8
      imagem_processada = redimensionar_imagem(imagem_original);
      exibir_imagem_processada(imagem_processada, 'Imagem Redimensionada');
    case 9
      transformada_dct_imagem(imagem_original); % Esta função já exibe a imagem
    case 10
      disp('Encerrando o processamento de imagens.');
      return;
    otherwise
      disp('Opção inválida. Por favor, escolha uma opção válida.');
  end

  if opcao ~= 10
    menu_processamento(imagem_original);
  end
end

function imagem_cinza = escala_cinza(imagem_original)
  if size(imagem_original, 3) == 3
    imagem_cinza = rgb2gray(imagem_original);
  else
    imagem_cinza = imagem_original;
    disp('A imagem já está em escala de cinza.');
  end
end

function exibir_imagem_processada(imagem_processada, titulo)
  figure;
  imshow(imagem_processada);
  title(titulo);
end

function imagem_filtrada = filtro_passa_baixa_imagem(imagem_original)
  if size(imagem_original, 3) == 3
    imagem_original = rgb2gray(imagem_original);
  else
    imagem_original = imagem_original;
  end
  disp('Aplicando Filtro Passa-Baixa (Filtro da Média)...');
  tamanho_filtro = input('Digite o tamanho da janela do filtro da média (e.g., 3 para 3x3, 5 para 5x5, deve ser ímpar e >=3): ');
  if isempty(tamanho_filtro) || ~isnumeric(tamanho_filtro) || mod(tamanho_filtro, 2) == 0 || tamanho_filtro < 3
    disp('Tamanho inválido. Usando 3x3 como padrão.');
    tamanho_filtro = 3;
  end
  kernel = ones(tamanho_filtro) / (tamanho_filtro * tamanho_filtro);
  imagem_filtrada = conv2(double(imagem_original), kernel, 'same');
  imagem_filtrada = uint8(imagem_filtrada);
end

function imagem_filtrada = filtro_passa_alta_imagem(imagem_original)
  if size(imagem_original, 3) == 3
    imagem_original = rgb2gray(imagem_original);
  else
    imagem_original = imagem_original;
  end
  disp('Aplicando Filtro Passa-Alta (Filtro Laplaciano)...');
  kernel_laplaciano = [0 1 0; 1 -4 1; 0 1 0];
  imagem_filtrada = conv2(double(imagem_original), kernel_laplaciano, 'same');
  imagem_filtrada = imagem_filtrada - min(imagem_filtrada(:));
  imagem_filtrada = imagem_filtrada / max(imagem_filtrada(:)) * 255;
  imagem_filtrada = uint8(imagem_filtrada);
end

function transformada_fourier_imagem(imagem_original)
  if size(imagem_original, 3) == 3
    imagem_original = rgb2gray(imagem_original);
  else
    imagem_original = imagem_original;
  end
  disp('Calculando a Transformada de Fourier 2D e exibindo o Espectro de Magnitude...');
  imagem_double = double(imagem_original);
  F = fft2(imagem_double);
  F_shifted = fftshift(F);
  magnitude_spectrum = log(1 + abs(F_shifted));
  figure;
  imshow(magnitude_spectrum, []);
  title('Espectro de Magnitude da Transformada de Fourier (log)');
end

function imagem_contrastada = realce_contraste_imagem(imagem_original)
  % Converte para escala de cinza para aplicar histeq
  if size(imagem_original, 3) == 3
    imagem_original_gray = rgb2gray(imagem_original);
  else
    imagem_original_gray = imagem_original;
  end
  disp('Aplicando Realce de Contraste (Histogram Equalization)...');
  imagem_contrastada = histeq(imagem_original_gray);
end

function imagem_bordas = deteccao_bordas_imagem(imagem_original)
  % Converte para escala de cinza para detecção de bordas
  if size(imagem_original, 3) == 3
    imagem_original_gray = rgb2gray(imagem_original);
  else
    imagem_original_gray = imagem_original;
  end
  disp('Aplicando Detecção de Bordas (Canny)...');
  % O método Canny é robusto e possui parâmetros opcionais, aqui usamos o padrão
  imagem_bordas = edge(imagem_original_gray, 'canny');
end

function imagem_sem_ruido = reducao_ruido_mediana_imagem(imagem_original)
  % Converte para escala de cinza
  if size(imagem_original, 3) == 3
    imagem_original_gray = rgb2gray(imagem_original);
  else
    imagem_original_gray = imagem_original;
  end
  disp('Aplicando Redução de Ruído (Filtro de Mediana)...');
  tamanho_filtro = input('Digite o tamanho da janela do filtro de mediana (e.g., 3 para 3x3, 5 para 5x5, deve ser ímpar e >=3): ');
  if isempty(tamanho_filtro) || ~isnumeric(tamanho_filtro) || mod(tamanho_filtro, 2) == 0 || tamanho_filtro < 3
    disp('Tamanho inválido. Usando 3x3 como padrão.');
    tamanho_filtro = 3;
  end
  % medfilt2 requer imagem em double para alguns tipos, ou usa uint8 diretamente
  imagem_sem_ruido = medfilt2(imagem_original_gray, [tamanho_filtro tamanho_filtro]);
end

function imagem_redimensionada = redimensionar_imagem(imagem_original)
  disp('Redimensionando Imagem...');
  nova_largura = input('Digite a nova largura desejada em pixels: ');
  if isempty(nova_largura) || ~isnumeric(nova_largura) || nova_largura <= 0
    disp('Largura inválida. Operação cancelada.');
    imagem_redimensionada = imagem_original; % Retorna a imagem original
    return;
  end

  % Redimensiona a imagem para a nova largura, mantendo a proporção
  % imresize aceita [numRows numCols] ou um fator de escala
  % Vamos manter a proporção calculando a nova altura
  [altura_original, largura_original, ~] = size(imagem_original);
  fator_escala = nova_largura / largura_original;
  nova_altura = round(altura_original * fator_escala);

  imagem_redimensionada = imresize(imagem_original, [nova_altura nova_largura]);
  disp(['Imagem redimensionada para ' num2str(nova_largura) 'x' num2str(nova_altura) ' pixels.']);
end

function transformada_dct_imagem(imagem_original)
  % Converte para escala de cinza para DCT
  if size(imagem_original, 3) == 3
    imagem_original_gray = rgb2gray(imagem_original);
  else
    imagem_original_gray = imagem_original;
  end
  disp('Calculando a Transformada Coseno Discreta (DCT 2D)...');

  % Converte para double para cálculos da DCT
  imagem_double = double(imagem_original_gray);

  % Calcula a DCT 2D
  C = dct2(imagem_double);

  % Para visualização, é comum usar o logaritmo da magnitude, similar à FFT
  % Nota: A DCT já concentra energia no canto superior esquerdo por natureza.
  % Para uma melhor visualização do espectro, podemos reescalar.
  magnitude_spectrum_dct = log(1 + abs(C));

  figure;
  imshow(magnitude_spectrum_dct, []); % Exibe com auto-escala
  title('Espectro de Coeficientes da Transformada Coseno Discreta (log)');

  disp('Visualizando os coeficientes da DCT. Componentes de baixa frequência (canto superior esquerdo) contêm mais energia.');
  disp('Para fins de compressão, muitos desses coeficientes de alta frequência podem ser descartados.');
end
