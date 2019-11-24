function Plotting(t,time, qd,vd,ad,type)
    if type == 'symbol'
        subplot(2,2,1),plot(time, subs(qd,t, time),'b.')
        legend('${q_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint coordinates', 'FontSize',12);
        subplot(2,2,2),plot(time, subs(vd,t, time),'r.')
        legend('${v_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint Velocity', 'FontSize',12);
        subplot(2,2,3),plot(time, subs(ad,t, time),'g.')
        legend('${a_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint Acceleration', 'FontSize',12);
%         pause(10);   
%         close all;
    elseif type == 'number'
        subplot(2,2,1),plot(time, qd,'b.')
        legend('${q_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint coordinates', 'FontSize',12);
        subplot(2,2,2),plot(time, vd,'r.')
        legend('${v_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint Velocity', 'FontSize',12);
        subplot(2,2,3),plot(time, ad,'g.')
        legend('${a_d}$','interpreter','latex','FontSize',15)
        xlabel('Time', 'FontSize',12);
        ylabel('Joint Acceleration', 'FontSize',12);
%         pause(10);   
%         close all;
    end
end

