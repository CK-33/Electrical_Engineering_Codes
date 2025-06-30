clear;

% Cria a pasta de saída para as imagens, se ela não existir
if ~exist('images', 'dir')
    mkdir('images');
end

% --- MENU DE SELEÇÃO DE SINAL ---
disp('--- SELEÇÃO DO SINAL DE ENTRADA ---');
disp('1. Carregar áudio "beethoven.wav" (Arquivo Real)');
disp('2. Gerar sinal sintético (Grave + Agudo)');
disp('3. Gerar Ruído Branco (Todas as frequências)');
disp('4. Gerar "Chirp" (Sweep de Frequência)');

escolha_sinal = input('Escolha o sinal que deseja analisar: ');

% Define as variáveis 'x' e 'fs' com base na escolha do usuário
switch escolha_sinal
    case 1
        % --- Opção 1: Carregar arquivo de áudio ---
        audio_filename = 'beethoven.wav';
        if ~exist(audio_filename, 'file')
            error(['Arquivo de áudio não encontrado: ' audio_filename]);
        end
        fprintf('Carregando áudio: %s\n', audio_filename);
        [x, fs] = audioread(audio_filename);
        x = x(:,1); % Garante que o sinal seja mono
        
    case 2
        % --- Opção 2: Gerar Soma de Senoides ---
        disp('Gerando sinal sintético (440 Hz + 8000 Hz)...');
        fs = 44100;
        duracao = 3;
        t = 0:1/fs:duracao-1/fs;
        sinal_grave = 0.5 * sin(2*pi*440*t);
        sinal_agudo = 0.5 * sin(2*pi*8000*t);
        x = sinal_grave + sinal_agudo;
        
    case 3
        % --- Opção 3: Gerar Ruído Branco ---
        disp('Gerando Ruído Branco...');
        fs = 44100;
        duracao = 3;
        x = 2 * rand(1, duracao * fs) - 1;
        
    case 4
        % --- Opção 4: Gerar "Chirp" ---
        disp('Gerando Sweep de Frequência (Chirp)...');
        fs = 44100;
        duracao = 5;
        t = 0:1/fs:duracao;
        x = chirp(t, 100, duracao, 15000); % Sweep de 100 Hz a 15 kHz
        
    otherwise
        error('Opção de sinal inválida. Rode o programa novamente.');
end

x = x(:); % Garante que 'x' seja sempre um vetor-coluna para consistência
disp('Sinal pronto para análise.');
disp('Áudio carregado com sucesso.');
disp(' ');

% --- LOOP DO MENU PRINCIPAL ---
while true
    disp('--- MENU DE PROCESSAMENTO DE ÁUDIO ---');
    disp('1. Reproduzir áudio');
    disp('2. Visualizar sinal no domínio do tempo');
    disp('3. Visualizar espectro de frequência (FFT)');
    disp('4. Visualizar espectrograma');
    disp('5. Comparar filtros Passa-Baixa (FIR vs IIR)');
    disp('6. Comparar filtros Passa-Alta (FIR vs IIR)');
    disp('7. Comparar efeito de janelas (Retangular vs Hamming)');
    disp('8. Sair');
    
    try
        opcao = input('Escolha uma opção: ');
    catch
        disp('Entrada inválida. Por favor, insira um número.');
        continue;
    end

    switch opcao
        case 1
            disp('Reproduzindo áudio...');
            sound(x, fs);
            disp('Reprodução concluída.');

        case 2
            plot_and_save_time(x, fs, 'Sinal_Tempo_Completo', 'Sinal no Domínio do Tempo');

        case 3
            plot_and_save_spectrum(x, fs, 'Sinal_FFT', 'Espectro de Frequência do Sinal Original');

        case 4
            plot_and_save_spectrogram(x, fs, 'Sinal_Espectrograma', 'Espectrograma do Sinal Original');

        case 5
            fc = 1000; % Frequência de corte para passa-baixa
            comparar_filtros(x, fs, 'low', fc);

        case 6
            fc = 3000; % Frequência de corte para passa-alta
            comparar_filtros(x, fs, 'high', fc);

        case 7
            comparar_janelas(x, fs);

        case 8
            disp('Programa finalizado.');
            break;

        otherwise
            disp('Opção inválida! Por favor, escolha um número de 1 a 8.');
    end
    disp(' '); % Linha em branco para melhor espaçamento
end
