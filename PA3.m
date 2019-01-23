clear 
clc
close all

C.m_0 = 9.10938215e-31;             % electron mass

f = 1E-35;
   
a = f/C.m_0;

v = 0;
x = 0;
%y = 1;

for t=1:100

    prob=rand;
    if prob<0.05
        v = 0;
    end
    
    storeV(t) = v;
    driftV = mean(storeV);
    
    subplot(2,1,1);
    scatter(t,x);
    title(['Drift Velocity = ',num2str(driftV)])
    xlabel('Time (s)')
    ylabel('Drift Velocity (m/s)')
    hold on

    subplot(2,1,2);
    hold all
    plot(t,v,'ro',t,driftV,'go');
    xlabel('Time (s)')
    ylabel('Average Drift Velocity (m/s)')
    pause(1)

    v = v + a*t;
    x = x + v*t + 1/2*a*t^2;
    
    xt(t) = x;
    vt(t) = v;
    tt(t) = t;
end

%     subplot(2,1,1);
%     scatter(tt,xt);
%     title(['Drift Velocity = ',num2str(driftV)])
%     xlabel('Time (s)')
%     ylabel('Drift Velocity (m/s)')
% %     hold on 
%     
%     subplot(2,1,2);
%     hold all
%     plot(tt,vt,'ro',tt,driftV,'go');
%     xlabel('Time (s)')
%     ylabel('Average Drift Velocity (m/s)')
