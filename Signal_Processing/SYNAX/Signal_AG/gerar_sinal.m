function sinal = gerar_sinal(tipo_sinal)
  % Solicita os parâmetros comuns a todos os sinais
  disp('**Parâmetros comuns:**');
  disp('A frequência de amostragem deve ser maior que o dobro da maior frequência do sinal (Teorema de Nyquist).');
  frequencia_amostragem = input('Frequência de amostragem (em Hz): ');
  tempo = 0:1/frequencia_amostragem:1;

  switch tipo_sinal
    case 1 % Senoidal
      disp('**Sinal Senoidal:**');
      disp('Gera um sinal senoidal com frequência e amplitude definidas.');
      disp('A frequência do sinal deve ser menor que a metade da frequência de amostragem.');
      frequencia = input('Frequência do sinal (em Hz): ');
      amplitude = input('Amplitude do sinal: ');
      % Validação da frequência
      while frequencia >= frequencia_amostragem / 2
        disp('Erro: A frequência do sinal deve ser menor que a metade da frequência de amostragem.');
        frequencia = input('Frequência do sinal (em Hz): ');
      end
      % Alerta sobre a amplitude
      if abs(amplitude) > 10
        disp('Aviso: A amplitude do sinal é muito grande. Pode ocorrer overflow.');
      end
      sinal = amplitude * sin(2*pi*frequencia*tempo);
    case 2 % Quadrado
      disp('**Sinal Quadrado:**');
      disp('Gera um sinal quadrado com frequência e amplitude definidas.');
      disp('A frequência do sinal deve ser menor que a metade da frequência de amostragem.');
      frequencia = input('Frequência do sinal (em Hz): ');
      amplitude = input('Amplitude do sinal: ');
      % Validação da frequência
      while frequencia >= frequencia_amostragem / 2
        disp('Erro: A frequência do sinal deve ser menor que a metade da frequência de amostragem.');
        frequencia = input('Frequência do sinal (em Hz): ');
      end
      sinal = amplitude * square(2*pi*frequencia*tempo);
    case 3 % Ruído
      disp('**Sinal de Ruído:**');
      disp('Gera um sinal de ruído aleatório com amplitude definida.');
      amplitude = input('Amplitude do ruído: ');
      sinal = amplitude * randn(size(tempo));
    case 4 % Sinal composto
      disp('**Sinal Composto:**');
      disp('Gera a soma de dois sinais senoidais com frequências e amplitudes definidas.');
      disp('As frequências dos sinais devem ser menores que a metade da frequência de amostragem.');
      frequencia1 = input('Frequência do primeiro sinal (em Hz): ');
      amplitude1 = input('Amplitude do primeiro sinal: ');
      frequencia2 = input('Frequência do segundo sinal (em Hz): ');
      amplitude2 = input('Amplitude do segundo sinal: ');
      % Validação das frequências
      while frequencia1 >= frequencia_amostragem / 2 || frequencia2 >= frequencia_amostragem / 2
        disp('Erro: As frequências dos sinais devem ser menores que a metade da frequência de amostragem.');
        frequencia1 = input('Frequência do primeiro sinal (em Hz): ');
        frequencia2 = input('Frequência do segundo sinal (em Hz): ');
      end
      sinal = amplitude1 * sin(2*pi*frequencia1*tempo) + amplitude2 * sin(2*pi*frequencia2*tempo);
    case 5 % Exponencial
      disp('**Sinal Exponencial:**');
      disp('Gera um sinal exponencial decrescente.');
      taxa_decrescimento = input('Taxa de decrescimento: ');
      sinal = exp(-taxa_decrescimento*tempo);
    case 6 % Ruído Gaussiano
      disp('**Sinal de Ruído Gaussiano:**');
      disp('Gera um sinal de ruído aleatório com distribuição gaussiana.');
      media = input('Média do ruído: ');
      desvio_padrao = input('Desvio padrão do ruído: ');
      sinal = media + desvio_padrao * randn(size(tempo));
    otherwise
      disp('Opção inválida.');
      sinal = [];
  end
end
