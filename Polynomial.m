function [qd,vd,ad] = Polynomial(t_IF,q_IF, qdot_IF, qdotdot_IF, n)
    % POLYNOMIAL POSITION PROFILE
    syms q a0 a1 a2 a3 a4 a5 a6 t
    % n - polynomial equation's power
    if n == 3
        q = a0+a1*t+a2*t^2+a3*t^3; %polynomial equation

        % differentiating q
        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2 t_IF(1)^3
        0 1 2*t_IF(1) 3*t_IF(1)^2
        1 t_IF(2) t_IF(2)^2 t_IF(2)^3
        0 1 2*t_IF(2) 3*t_IF(2)^2];

        b = [q_IF(1); qdot_IF(1); q_IF(2); qdot_IF(2)];

        a = inv(M)*b;
        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
        vd = subs(q_dot,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
        ad = subs(q_dotdot,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
    elseif n == 31
        q = a0+a1*t+a2*t^2+a3*t^3; %polynomial equation

        % differentiating q
        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2 t_IF(1)^3 
        0 1 2*t_IF(1) 3*t_IF(1)^2
        1 t_IF(2) t_IF(2)^2 t_IF(2)^3
        0 0 2 6*t_IF(1)];

        b = [q_IF(1); qdot_IF(1); q_IF(2); qdotdot_IF(1)];

        a = inv(M)*b;
        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
        vd = subs(q_dot,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
        ad = subs(q_dotdot,{a0, a1, a2, a3}, {a(1), a(2), a(3), a(4)});
    elseif n == 42
        q = a0+a1*t+a2*t^2+a3*t^3+a4*t^4; %polynomial equation

        % differentiating q
        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2 t_IF(1)^3 t_IF(1)^4 
        0 1 2*t_IF(1) 3*t_IF(1)^2 4*t_IF(1)^3
        1 t_IF(2) t_IF(2)^2 t_IF(2)^3 t_IF(2)^4
        0 1 2*t_IF(2) 3*t_IF(2)^2 4*t_IF(2)^3
        0 0 2 6*t_IF(2) 12*t_IF(2)^2];

        b = [q_IF(1); qdot_IF(1); q_IF(2); qdot_IF(2); qdotdot_IF(2)];

        a = inv(M)*b;
        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2, a3, a4}, {a(1), a(2), a(3), a(4), a(5)});
        vd = subs(q_dot,{a0, a1, a2, a3, a4}, {a(1), a(2), a(3), a(4), a(5)});
        ad = subs(q_dotdot,{a0, a1, a2, a3, a4}, {a(1), a(2), a(3), a(4), a(5)});
    
    elseif n == 2
        q = a0+a1*t+a2*t^2; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2
            0    1      2*t_IF(1)
            0    1      2*t_IF(2)];

        b = [q_IF(1); qdot_IF(1); qdot_IF(2)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2}, {a(1), a(2), a(3)});
        vd = subs(q_dot,{a0, a1, a2}, {a(1), a(2), a(3)});
        ad = subs(q_dotdot,{a0, a1, a2}, {a(1), a(2), a(3)});
    elseif n == 6
        q = a0+a1*t+a2*t^2+a3*t^3+a4*t^4+a5*t^5+a6*t^6; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [ 1 t_IF(1) t_IF(1)^2 t_IF(1)^3 t_IF(1)^4 t_IF(1)^5 t_IF(1)^6;
        0 1 2*t_IF(1) 3*t_IF(1)^2 4*t_IF(1)^3 5*t_IF(1)^4 6*t_IF(1)^5;
        0 0 2 6*t_IF(1) 12*t_IF(1)^2 20*t_IF(1)^3 30*t_IF(1)^4;
        1 t_IF(2) t_IF(2)^2 t_IF(2)^3 t_IF(2)^4 t_IF(2)^5 t_IF(2)^6;
        0 1 2*t_IF(2) 3*t_IF(2)^2 4*t_IF(2)^3 5*t_IF(2)^4 6*t_IF(2)^5;
        0 0 2 6*t_IF(2) 12*t_IF(2)^2 20*t_IF(2)^3 30*t_IF(2)^4;
        1 t_IF(3) t_IF(3)^2 t_IF(3)^3 t_IF(3)^4 t_IF(3)^5 t_IF(3)^6];

        b = [q_IF(1); qdot_IF(1); qdotdot_IF(1); ...
            q_IF(2); qdot_IF(2); qdotdot_IF(2); q_IF(3)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2, a3, a4, a5, a6}, {a(1), a(2), a(3), a(4), a(5), a(6), a(7)});
        vd = subs(q_dot,{a0, a1, a2, a3, a4, a5, a6}, {a(1), a(2), a(3), a(4), a(5), a(6), a(7)});
        ad = subs(q_dotdot,{a0, a1, a2, a3, a4, a5, a6}, {a(1), a(2), a(3), a(4), a(5), a(6), a(7)});
    elseif n == 21
        q = a0+a1*t+a2*t^2; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2
            0    1      2*t_IF(1)
            0    0      2];

        b = [q_IF(1); qdot_IF(1); qdotdot_IF(1)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2}, {a(1), a(2), a(3)});
        vd = subs(q_dot,{a0, a1, a2}, {a(1), a(2), a(3)});
        ad = subs(q_dotdot,{a0, a1, a2}, {a(1), a(2), a(3)});
    elseif n == 22
        q = a0+a1*t+a2*t^2; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(2) t_IF(2)^2
            0    1      2*t_IF(2)
            0    0      2];

        b = [q_IF(2); qdot_IF(2); qdotdot_IF(2)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2}, {a(1), a(2), a(3)});
        vd = subs(q_dot,{a0, a1, a2}, {a(1), a(2), a(3)});
        ad = subs(q_dotdot,{a0, a1, a2}, {a(1), a(2), a(3)});
    elseif n == 23
        q = a0+a1*t+a2*t^2; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [0 0 2*t_IF(2)
            0    1      2*t_IF(2)
            1 t_IF(2) t_IF(2)^2];

        b = [qdotdot_IF(2); qdot_IF(2); q_IF(2)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2}, {a(1), a(2), a(3)});
        vd = subs(q_dot,{a0, a1, a2}, {a(1), a(2), a(3)});
        ad = subs(q_dotdot,{a0, a1, a2}, {a(1), a(2), a(3)});
    elseif n == 24
        q = a0+a1*t+a2*t^2; %polynomial equation

        q_dot = diff(q,t);
        q_dotdot = diff(q_dot,t);

        % Solution: 
        M = [1 t_IF(1) t_IF(1)^2
            0    1      2*t_IF(1)
            1 t_IF(2) t_IF(2)^2];

        b = [q_IF(1); qdot_IF(1); q_IF(2)];

        a = inv(M)*b;

        %desired a, velocity and acceleration
        qd = subs(q,{a0, a1, a2}, {a(1), a(2), a(3)});
        vd = subs(q_dot,{a0, a1, a2}, {a(1), a(2), a(3)});
        ad = subs(q_dotdot,{a0, a1, a2}, {a(1), a(2), a(3)});
    end
end

