function sinal_filtrado = aplicar_filtro(sinal)
  % Menu de seleção de filtro
  disp('Selecione o tipo de filtro:');
  disp('1. Passa-baixa');
  disp('2. Passa-alta');
  disp('3. Passa-faixa');
  tipo_filtro = input('Opção: ');

  % Solicita os parâmetros do filtro
  ordem = input('Ordem do filtro: ');
  frequencia_amostragem = input('Frequência de amostragem: ');

  switch tipo_filtro
    case 1
      frequencia_corte = input('Frequência de corte: ');
      sinal_filtrado = filtro_passa_baixa(sinal, ordem, frequencia_corte, frequencia_amostragem);
    case 2
      frequencia_corte = input('Frequência de corte: ');
      sinal_filtrado = filtro_passa_alta(sinal, ordem, frequencia_corte, frequencia_amostragem);
    case 3
      frequencia_corte_inferior = input('Frequência de corte inferior: ');
      frequencia_corte_superior = input('Frequência de corte superior: ');
      sinal_filtrado = filtro_passa_faixa(sinal, ordem, frequencia_corte_inferior, frequencia_corte_superior, frequencia_amostragem);
    otherwise
      disp('Opção inválida.');
      sinal_filtrado = sinal; % Retorna o sinal original em caso de opção inválida
  end
end

function sinal_filtrado = filtro_passa_baixa(sinal, ordem, frequencia_corte, frequencia_amostragem)
  % Filtro passa-baixa Butterworth
  fc_normalizada = frequencia_corte / (frequencia_amostragem / 2);
  [b, a] = butter(ordem, fc_normalizada, 'low');
  sinal_filtrado = filter(b, a, sinal);
end

function sinal_filtrado = filtro_passa_alta(sinal, ordem, frequencia_corte, frequencia_amostragem)
  % Filtro passa-alta Butterworth
  fc_normalizada = frequencia_corte / (frequencia_amostragem / 2);
  [b, a] = butter(ordem, fc_normalizada, 'high');
  sinal_filtrado = filter(b, a, sinal);
end

function sinal_filtrado = filtro_passa_faixa(sinal, ordem, frequencia_corte_inferior, frequencia_corte_superior, frequencia_amostragem)
  % Filtro passa-faixa Butterworth
  fc_normalizada = [frequencia_corte_inferior, frequencia_corte_superior] / (frequencia_amostragem / 2);
  [b, a] = butter(ordem, fc_normalizada, 'bandpass');
  sinal_filtrado = filter(b, a, sinal);
end
