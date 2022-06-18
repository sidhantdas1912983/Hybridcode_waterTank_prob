# Hybridcode_waterTank_prob
Hybrid system
%problem description
 Two tank system, consists of two tanks containing water. Both tanks are
leaking at constant rates v1 and v2, respectively. Water is added to the system at a constant rate w through
a hose, which at any point in time is dedicated to either one tank or the other. It is assumed that the hose
can switch between the tanks instantaneously. For i = 1,2, let xi denote the volume of water in Tank i and
vi > 0 denote the constant flow of water out of Tank i. Let w denote the constant flow of water into the
system. The objective is to keep the water volumes above r1 and r2, respectively, assuming that the water
volumes are above r1 and r2 initially. This is to be achieved by a controller that switches the inflow to Tank
1 whenever x1 ≤r1 and to Tank 2 whenever x2 ≤r2.
This process can be described using a hybrid automaton with the following components:
• Q = {q1,q2}, two discrete states, corresponding to inflow going left and inflow going right.
• X ∈R2, two continuous states, the levels of water in the two tanks.
• A vector field f(q1,x) =[w −v1−v2]
and f(q2,x) =[ −v1w −v2]
such that when the inflow is going to the
tank on the right, the water level in the left tank goes down while the water level in right tank goes
up, and vice versa.
• Initial states, Init = {q1,q2}×{x ∈R2|x1 ≥r1 ∧x2 ≥r2}, i.e. start with both water levels above the
low level marks r1 and r2.
• Domains Dom(q1) = {x ∈ R2|x2 ≥ r2} and Dom(q2) = {x ∈ R2|x1 ≥ r1} reflecting the fact that we
put water in the current tank as long as the level in the other tank is above the low level mark.
• Edges E = {(q1,q2),(q2,q1)}, reflecting the fact that it is possible to switch inflow from left to right
and vice versa.
• Guards G(q1,q2) = {x ∈ R2|x2 ≤ r2} and G(q2,q1) = {x ∈ R2|x1 ≤ r1} to allow us to switch the
inflow to the other tank as soon as the water there reaches the low level mark.
• Reset relation equal to the identity map for x, R(q1,q2,x) = R(q2,q1,x) = {x}, since the continuous
state does not change as a result of switching the inflow.

%parameters for problem simulation
r1 = 1, r2 = 1.5, v1 = 1, v2 = 1, w = 1.8, x1(0) = 2, x2(0) = 2.5 and q(0) = q1
for 15 seconds.

%%DOWNLOAD HYBRID EQUATION TOOLBOX
link: https://www.mathworks.com/matlabcentral/fileexchange/41372-hybrid-equations-toolbox-v2-04?s_tid=mwa_osa_a
