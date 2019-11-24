function V = V_solve(tb,t_IF,q_IF, qdot_IF)
    syms qf q0 V V0 t0 tff Vf
    
    % the area below the velocity graph = qf - q0
    
    eqn = 0.5*(V0+V)*(tb)+V*(tff-2*tb-t0)+0.5*(Vf+V)*tb== (qf-q0);
    V = solve(eqn,V);
    V = simplify(V);
    V = subs(V,{qf, q0, V0, t0, tff, Vf},{q_IF(2),q_IF(1),qdot_IF(1),t_IF(1), ... 
        t_IF(2),qdot_IF(2)});
    
end