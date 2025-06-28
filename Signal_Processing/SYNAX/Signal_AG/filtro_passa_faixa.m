function sinal_filtrado = filtro_passa_faixa(sinal, ordem, frequencia_corte_inferior, frequencia_corte_superior, frequencia_amostragem)
  % Filtro passa-faixa FIR
  normalizado_fc = [frequencia_corte_inferior, frequencia_corte_superior] / (frequencia_amostragem / 2);
  coeficientes = fir1(ordem, normalizado_fc, 'bandpass');
  sinal_filtrado = filter(coeficientes, 1, sinal);
end
