function tau = CalcularTau(tiempo,amplitud)
    % Calcula tau de una se�al descendiente. El primer subindice
    % debe ser el de mayor amplitud y el �ltimo el de menor amplitud.

    amplitud_normalizada = (amplitud-amplitud(end))/(amplitud(1)-amplitud(end));
    
    aux = find(amplitud_normalizada <= exp(-1));
    tau = tiempo(aux(1)) - tiempo(1);
    
end