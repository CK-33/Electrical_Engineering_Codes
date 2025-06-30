% Adicione esta função no final do seu script
function audio_norm = normalizar_audio(audio_in)
    % Normaliza o áudio para o intervalo [-1, 1] para evitar clipping
    pico = max(abs(audio_in));
    if pico > 0
        audio_norm = audio_in / pico;
    else
        audio_norm = audio_in;
    end
end