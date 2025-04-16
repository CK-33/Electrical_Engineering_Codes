function sinal_filtrado = filtro_passa_alta(sinal, ordem, frequencia_corte, frequencia_amostragem)
  % Filtro passa-alta FIR
  normalizado_fc = frequencia_corte / (frequencia_amostragem / 2);
  coeficientes = fir1(ordem, normalizado_fc, 'high');
  sinal_filtrado = filter(coeficientes, 1, sinal);
end
