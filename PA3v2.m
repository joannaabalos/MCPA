clear 
clc
close all

C.m_0 = 9.10938215e-31;             % electron mass

f1 = 1E-35;
f2 = 1E-35;
   
a1 = f1/C.m_0;
a2 = f2/C.m_0;

v1 = 0;
x1 = 0;
v2 = 0;
x2 = 0;
%y = 1;

for t=1:100

    prob1=rand;
    if prob1<0.05
        v1 = 0;
    end
    
        prob2=rand;
    if prob2<0.05
        v2 = 0;
    end
    
    storeV1(t) = v1;
    storeV2(t) = v2;
    driftV1 = mean(storeV1);
    driftV2 = mean(storeV2);
    driftV = mean(storeV1+storeV2);

    
    subplot(2,1,1);
    hold all
    plot(t,x1,'ro',t,x2,'bo');
    title(['Drift Velocity1 = ',num2str(driftV)])
    xlabel('Time (s)')
    ylabel('Drift Velocity (m/s)')
    hold on

    subplot(2,1,2);
    hold all
    plot(t,v1,'ro',t,driftV1,'go',t,v2,'bo',t,driftV1);
    xlabel('Time (s)')
    ylabel('Average Drift Velocity (m/s)')
    pause(.01)

    v1 = v1 + a1*t;
    x1 = x1 + v1*t + 1/2*a1*t^2;
    v2 = v2 + a2*t;
    x2 = x2 + v2*t + 1/2*a2*t^2;
    
    xt(t) = x1;
    vt(t) = v1;
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
