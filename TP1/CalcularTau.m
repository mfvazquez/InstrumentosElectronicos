function tau = CalcularTau(tiempo,amplitud)
    % Calcula tau de una senial descendiente. El primer subindice
    % debe ser el de mayor amplitud y el ultimo el de menor amplitud.

    amplitud_normalizada = (amplitud-amplitud(end))/(amplitud(1)-amplitud(end));
    
    aux = find(amplitud_normalizada <= exp(-1));
    tau = tiempo(aux(1)) - tiempo(1);
    
end