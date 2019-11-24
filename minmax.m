function [intv, intacc] = minmax(n,velocity, acc, type,t_IF, k)
%UNTITLED Summary of this function goes here
syms t
    if type == 'number'
        maxv = velocity(1);
        minv = velocity(1);

        maxa = acc(1);
        mina = acc(1);

        for i = 1:n
           if velocity(i)> maxv
            maxv = velocity(i);
           elseif velocity(i) < minv
            minv = velocity(i);
           end
           if acc(i)> maxa
            maxa = acc(i);
           elseif acc(i) < mina
            mina = acc(i);
           end
        end
    elseif type == 'symbol'
        maxv = subs(velocity,t, t_IF(1));
        minv = subs(velocity,t, t_IF(1));

        maxa = subs(acc,t, t_IF(1));
        mina = subs(acc,t, t_IF(1));

        for i = 1:n
           if subs(velocity,t, i*k)> maxv
            maxv = subs(velocity,t, i*k);
           elseif subs(velocity,t, i*k) < minv
            minv = subs(velocity,t, i*k);
           end
           if subs(acc,t, i*k)> maxa
            maxa = subs(acc,t, i*k);
           elseif subs(acc,t, i*k) < mina
            mina = subs(acc,t, i*k);
           end
        end
    end
    intacc = [mina; maxa];
    intv = [minv; maxv];
end

