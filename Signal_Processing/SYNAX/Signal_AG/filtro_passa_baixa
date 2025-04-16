function sinal_filtrado = filtro_passa_baixa(sinal, ordem, frequencia_corte, frequencia_amostragem)
  % Filtro passa-baixa FIR
  normalizado_fc = frequencia_corte / (frequencia_amostragem / 2);
  coeficientes = fir1(ordem, normalizado_fc, 'low');
  sinal_filtrado = filter(coeficientes, 1, sinal);
end
