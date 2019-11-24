function [qd,vd,ad,n,k] = Spline(t_IF,q_IF, qdot_IF, qdotdot_IF)
    syms q a0 a1 a2 a3 a4 a5 a6 t qd_tb
    k = 0.05;
    i = 0;
    [qd1,vd1,ad1] = Polynomial([t_IF(1) t_IF(3) t_IF(2)], ... 
        [q_IF(1) q_IF(3) q_IF(2)],  ...
        [qdot_IF(1) qdot_IF(2)], qdotdot_IF, 31);
        qds = subs(qd1,t,t_IF(3));
        vds = subs(vd1,t,t_IF(3));
    [qd2,vd2,ad2] = Polynomial([t_IF(3) t_IF(2) t_IF(1)], ... 
        [qds q_IF(2) q_IF(1)],  ...
        [vds qdot_IF(2)], qdotdot_IF, 42);
    for time = t_IF(1):k:t_IF(2)
        if time>=t_IF(1) && time<=t_IF(3)
            i = i+1;
            qd(i) = subs(qd1,t,time);
            vd(i) = subs(vd1,t,time);
            ad(i) = subs(ad1,t,time);
        end 
        if time>=t_IF(3) && time<=t_IF(2)
            i = i+1;
            qd(i) = subs(qd2,t,time);
            vd(i) = subs(vd2,t,time);
            ad(i) = subs(ad2,t,time);
        end
    end
    n = i;
    
end

