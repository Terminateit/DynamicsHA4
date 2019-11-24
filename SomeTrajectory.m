function [qd,vd,ad] = SomeTrajectory(t_IF,q_IF, qdot_IF)
    syms a b c C0 t real

    q = a*b*t-(a/c)*cos(c*t)+C0;
    q_dot = diff(q,t);
    q_dotdot = diff(q_dot,t);

    P = solve(subs(q,t,t_IF(1))== q_IF(1), ...
                subs(q_dot,t,t_IF(1)) == qdot_IF(1), ...
            subs(q,t,t_IF(2))== q_IF(2), ...
                subs(q_dot,t,t_IF(2)) == qdot_IF(2));

    qd = subs(q,{a, b, c, C0},{P.a(1), P.b(1), P.c(1), P.C0(1)});
    vd = subs(q_dot,{a, b, c, C0},{P.a(1), P.b(1), P.c(1), P.C0(1)});
    ad = subs(q_dotdot,{a, b, c, C0},{P.a(1), P.b(1), P.c(1), P.C0(1)});
end