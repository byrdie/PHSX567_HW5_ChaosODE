% Damped pendulum quations of motion
function dxdt = pendulum(x,t)
   % Parameters for the pendulum system
   global g L mu Q E m w
      
   % ODEs
   dxdt(1) = x(2);
   dxdt(2) = - (g ./ L) .* sin(x(1)) - mu .* x(2) + ((Q .* E) ./ (m * L)) .* cos(x(1)) .* cos(w .* t);

