function processamento_sinal()
  % Explicação do programa
  disp('**Gerador e Processador de Sinais**');
  disp('Este programa permite gerar e processar sinais de entrada.');
  disp('Siga as instruções abaixo para utilizar o programa.');
  disp(' ');

  % Menu de seleção de tipo de sinal
  disp('**Selecione o tipo de sinal que deseja gerar:**');
  disp('1. Senoidal: Gera um sinal senoidal com frequência e amplitude definidas.');
  disp('2. Quadrado: Gera um sinal quadrado com frequência e amplitude definidas.');
  disp('3. Ruído: Gera um sinal de ruído aleatório com amplitude definida.');
  disp('4. Sinal composto: Gera a soma de dois sinais senoidais com frequências e amplitudes definidas.');
  disp('5. Exponencial: Gera um sinal exponencial decrescente.');
  disp('6. Ruído Gaussiano: Gera um sinal de ruído aleatório com distribuição gaussiana.');

  tipo_sinal = input('Opção: ');

  % Validação de entrada
  while tipo_sinal < 1 || tipo_sinal > 6
    disp('Opção inválida. Digite um número entre 1 e 6.');
    tipo_sinal = input('Opção: ');
  end

  % Limpar o console usando clc
  clc;

  % Gere o sinal com base na escolha do usuário
  disp('Gerando sinal...');
  sinal = gerar_sinal(tipo_sinal);

  % Limpar o console usando clc
  clc;

  % Visualize o sinal gerado
  disp('Exibindo sinal gerado...');
  visualizar_sinal(sinal);

  % Menu de seleção de filtro
  disp('Aplicando filtro...');
  sinal_filtrado = aplicar_filtro(sinal); % Modificação aqui

  % Limpar o console usando clc
  clc;

  % Visualize o sinal filtrado
  disp('Exibindo sinal filtrado...');
  visualizar_sinal(sinal_filtrado); % Modificação aqui

  % Limpar o console usando clc
  clc;
end
