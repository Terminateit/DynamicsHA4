function [qd,vd,ad,n,k] = LSPB(t_IF,q_IF, qdot_IF, qdotdot_IF, trap)
    syms q a0 a1 a2 a3 a4 a5 a6 t qd_tb
    if trap == 1
        % Calculate tb (according to Spong's book)
        tb_max = (t_IF(2)+t_IF(1))/2;
        tb_min = t_IF(1);
        tb_interval = [tb_min tb_max];
        tb = mean(tb_interval)-t_IF(1);

        t_b = [t_IF(1) tb t_IF(3)];
        q_b = [q_IF(1) 0 q_IF(3)];
        % Calculate V
        V = V_solve(tb,t_IF,q_IF, qdot_IF);
        qdot_b = [qdot_IF(1) V];
        k = 0.05;
        i = 0;
        for time = t_IF(1):k:t_IF(2)

            if time>=t_IF(1) && time<=tb + t_IF(1)
                i = i+1;
                [qd(i),vd(i),ad(i)] = Polynomial(t_b,q_b, qdot_b, [qdotdot_IF(1) 0], 2);
                qd_tb = subs(qd(i),t,time);
                qd(i) = subs(qd(i),t,time);
                vd(i) = subs(vd(i),t,time);
                ad(i) = subs(ad(i),t,time);
                tk = time;
            end
            if time > tb + t_IF(1) && time<=(t_IF(2)-tb)
                i = i+1;
                qd(i) = qd_tb+V*(t-tk);
                qd(i) = subs(qd(i),t,time);
                vd(i) = V;
                ad(i) = 0;
                t_f = [t_IF(2)-tb t_IF(2) t_IF(3)];
                q_f = [subs(qd(i),t,time) q_IF(2) q_IF(3)];
                qdot_f = [subs(vd(i),t,time) qdot_IF(2)];
            end
            if time >(t_IF(2)-tb) && time<=t_IF(2)
                i = i+1;
                [qd(i),vd(i),ad(i)] = Polynomial(t_f,q_f, qdot_f,[0 qdotdot_IF(2)], 2);
                qd(i) = subs(qd(i),t,time);
                vd(i) = subs(vd(i),t,time);
                ad(i) = subs(ad(i),t,time);
            end
        end
    elseif trap == 3
        
        % Calculate tb (according to Spong's book)
        tb_max = (t_IF(3)+t_IF(1))/2;
        tb_min = t_IF(1);
        tb_interval = [tb_min tb_max];
        tb = mean(tb_interval)-t_IF(1);

        t_b = [t_IF(1) tb t_IF(3)];
        q_b = [q_IF(1) 0 q_IF(3)];
        % Calculate V
        V = V_solve(tb,t_IF,q_IF, qdot_IF);
        qdot_b = [qdot_IF(1) V];
        k = 0.05;
        i = 0;
        for time = t_IF(1):k:t_IF(2)

            if time>=t_IF(1) && time<=tb + t_IF(1)
                i = i+1;
                [qd(i),vd(i),ad(i)] = Polynomial(t_b,q_b, qdot_b, [qdotdot_IF(1) 0], 2);
                qd_tb = subs(qd(i),t,time);
                qd(i) = subs(qd(i),t,time);
                vd(i) = subs(vd(i),t,time);
                ad(i) = subs(ad(i),t,time);
                tk = time;
            end
            if time > tb + t_IF(1) && time<=(t_IF(3)-tb)
                i = i+1;
                qd(i) = qd_tb+V*(t-tk);
                qd(i) = subs(qd(i),t,time);
                vd(i) = V;
                ad(i) = 0;
                t_f = [t_IF(3)-tb t_IF(3) t_IF(3)];
                q_f = [subs(qd(i),t,time) q_IF(3) q_IF(3)];
                qdot_f = [subs(vd(i),t,time) qdot_IF(2)];
            end
            if time >(t_IF(3)-tb) && time<=t_IF(3)
                i = i+1;
                [qd(i),vd(i),ad(i)] = Polynomial(t_f,q_f, qdot_f,[0 qdotdot_IF(2)], 21);
                qd(i) = subs(qd(i),t,time);
                vd(i) = subs(vd(i),t,time);
                ad(i) = subs(ad(i),t,time);
            end
            if time>t_IF(3) && time<=t_IF(2)
                % Calculate tb (according to Spong's book)
                tb_max = (t_IF(2)+t_IF(3))/2;
                tb_min = t_IF(3);
                tb_interval = [tb_min tb_max];
                tb = mean(tb_interval)-t_IF(3);

                t_b = [t_IF(3) tb t_IF(3)];
                q_b = [q_IF(3) 0 q_IF(3)];
                % Calculate V
                V = V_solve(tb,t_IF,q_IF, qdot_IF);
                qdot_b = [qdot_IF(1) V];
                if time>t_IF(3) && time<=tb + t_IF(3)
                    i = i+1;
                    [qd(i),vd(i),ad(i)] = Polynomial(t_b,q_b, qdot_b, [qdotdot_IF(1) 0], 2);
                    qd_tb = subs(qd(i),t,time);
                    qd(i) = subs(qd(i),t,time);
                    vd(i) = subs(vd(i),t,time);
                    ad(i) = subs(ad(i),t,time);
                    tk = time;
                end
                if time > tb + t_IF(3) && time<=(t_IF(2)-tb)
                    i = i+1;
                    qd(i) = qd_tb+V*(t-tk);
                    qd(i) = subs(qd(i),t,time);
                    vd(i) = V;
                    ad(i) = 0;
                    t_f = [t_IF(2)-tb t_IF(2) t_IF(3)];
                    q_f = [qd(i) q_IF(2) q_IF(3)];
                    qdot_f = [subs(vd(i),t,time) qdot_IF(2)];
                end
                if time >(t_IF(2)-tb) && time<=t_IF(2)
                    i = i+1;
                    [qd(i),vd(i),ad(i)] = Polynomial(t_f,q_f, qdot_f,[0 qdotdot_IF(2)], 2);
                    qd(i) = subs(qd(i),t,time);
                    vd(i) = subs(vd(i),t,time);
                    ad(i) = subs(ad(i),t,time);
                end
            end   
        end
    end
    n = i;
end

