%initial conditions
x1_ini=2;
x2_ini=2.5;
q_0=1;
x0 = [x1_ini,x2_ini,q_0]
%simulation horizon
Tspan = [0 15];
Jspan = [0 100];
%rules for jump
%rule1 ->priority for jumps
%rule2 ->priority for flow
rule= 1;
options = odeset('RelTol',1e-6,'MaxStep',0.1);
%simulate
[t,j,x] =HyEQsolver(@fmap,@jmap,@fcon,@jset,x0,Tspan,Jspan,rule,options,'ode23t');
%plot slutions
figure(1)%position
clf
subplot(3,1,1), plotHarc(t,j,x(:,1));
ylabel('x_1')
xlabel('t')
subplot(3,1,2), plotHarc(t,j,x(:,2));
ylabel('x_2')
xlabel('t')
subplot(3,1,3), plotHarc(t,j,x(:,3));
ylabel('q')
xlabel('t')

function xdot = fmap(x)
%parameters
v1=1;
v2=1;
w=1.8;
%mapping the flow with differential equations
xdot = [-v1+0.5*(1+x(3))*w;-v2+0.5*(1-x(3))*w;0];
end

function xplus = jmap(x)
%flow state
xplus= [x(1)+1e-5;x(2)+1e-5;-x(3)];
end

%flow condition which will can have a value inbetween 0 to inf
function [values] = fcon(x)
r1=1;
r2=1.5;
x1=x(1);
x2=x(2);
if (x1>=r1 && x2>= r2)
    values = 1;
else
    values =0;
end
end
function inside = jset(x)
%parameters
r1=1;
r2=1.5;
x1=x(1);
x2 = x(2);
if (x1<=r1|| x2<=r2)
    inside=1;
else 
    inside=0;
end
end

 
