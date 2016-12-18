%Initialization
% x:= vector which contains values for n_a which is defined as the
%distance betwenn the crosswalk and the yieldline measured in cars
x = [1 2 3 4 5];
%Z := general entry-capacity of the roundabout stored in a vector matrix with the results of c_s(x,q) [cars/hour]
Z = zeros(11,5);
%q := circulating flow infront of the subject entrance [cars/sec]
q = [0.1 100 200 300 400 500 600 700 800 900 1000];
%z := general entry-capacity of the roundabout stored in a vector with the results of c_s(x,800) [cars/hour]
z2 = zeros(5);

%Determ cs(n_a) for q_c = 800
for i=1:(5)
   
    z12 = x(i);
    z22 = (1/3600)*800;
    z2(i)= cs(z12, z22);
end

%Plot of cs(n_a)
figure(2);
plot(x,z2,'LineWidth', 2);
box on;
grid on;
set(gca, 'FontSize', 16);
xlabel('n_a [cars]','FontSize', 16);
ylabel('cs [cars/hour]','FontSize', 16);

%Determ cs(n_a,q_cir)
for i=1:(5)
    for j=1:11
    z1 = x(i);
    z2 = (1/3600)*q(j);
    Z(j,i)= cs(z1, z2);
    end
end

%Plot of cs(n_a,q_cir)
figure(1);
surface(x,q,Z,'LineWidth', 2);
box on;
grid on;
set(gca, 'FontSize', 16);
xlabel('n_a [cars]','FontSize', 16);
ylabel('q_c [cars/hour]','FontSize', 16);
zlabel('cs [cars/hour]','FontSize', 16);

fid=fopen('cs1','w+')
fprintf(fid,'n_a:     ',x(i));
for i = 1:(5)
        fprintf(fid,'%e     ',x(i));
end

% Save cs(n_a,q_cir) to cs1
fprintf(fid,'\n');
fprintf(fid,'q_cir:     ',x(i));
for i = 1:(11)
        fprintf(fid,'%e     ',q(i));
end

fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'Cs(n_a,q_cir):     ');
fprintf(fid,'\n');

for i = 1:(11)
    for j = 1:(5)
        fprintf(fid,'%e     ',Z(i,j));
    end
    fprintf(fid,'\n');
end

fclose(fid);

