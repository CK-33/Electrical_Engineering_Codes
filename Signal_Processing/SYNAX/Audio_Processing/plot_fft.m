function plot_fft(x, fs, titulo)
    N = length(x);
    X = fft(x);
    f = linspace(0, fs, N);
    figure;
    plot(f(1:N/2), abs(X(1:N/2)));
    xlabel('Frequência (Hz)'); ylabel('Magnitude');
    title(titulo);
end
