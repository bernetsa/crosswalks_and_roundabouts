%Initialisation

%q_c := circulating flow in front of the subject entrance [cars/sec]
q_c =       (1/3600) * 0.8 * [550 450 350 200 100 50 50 50 50 100 200 300 600 700 800 1000 1200 1400 1150 900 750 700 650 700 850 950 900 1000 1000 850 750 700 750 850 950 1150 1350 1450 1100 950 900 850 800 700 700 700 600 550];
%q_cprime := circulating flow in front of the main exit [cars/sec]
q_cprime =  (1/3600) * [550 450 350 200 100 50 50 50 50 100 200 300 600 700 800 1000 1200 1400 1150 900 750 700 650 700 850 950 900 1000 1000 850 750 700 750 850 950 1150 1350 1450 1100 950 900 850 800 700 700 700 600 550];
%q_p := pedestrians crossing the crosswalk at the subject entrance [pedestrians/sec]
q_p =       (1/3600) * 0.6 * [25 25 25 25 25 25 25 25 25 25 25 50 50 75 100 125 175 175 200 225 225 225 250 275 300 300 275 275 275 275 275 275 275 275 275 250 225 225 175 150 150 125 125 100 75 50 50 50];
%q_pprime := pedestrians crossing the crosswalk at the main entrance [pedestrians/sec]
q_pprime =  (1/3600) * [25 25 25 25 25 25 25 25 25 25 25 50 50 75 100 125 175 175 200 225 225 225 250 275 300 300 275 275 275 275 275 275 275 275 275 250 225 225 175 150 150 125 125 100 75 50 50 50];
%t := time of the day;
t = [0.0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12 12.5 13 13.5 14 14.5 15 15.5 16 16.5 17 17.5 18 18.5 19 19.5 20 20.5 21 21.5 22 22.4 23 23.5];
%c_s := general entry-capacity of the roundabout for n_a= 1 [cars/hour]
cs_n1 = zeros(length(t));
%c_s := general entry-capacity of the roundabout for n_a= 2 [cars/hour]
cs_n2 = zeros(length(t));

%Settings for the plot
figure(3);
hold on
box on;
grid on;
title('Entrance-Capacity over a day')
set(gca, 'FontSize', 16);
xlabel('Daytime','FontSize', 16);
ylabel('cs [cars/hour]','FontSize', 16);
axis([0.0,23.5,0,1200])

%Calculation and plotting of cs(for n_a = 2)
for i = 1: (length(t)-1)
c1_temp = cs(2,q_c(i),q_cprime(i),q_p(i),q_pprime(i));
c2_temp = cs(2,q_c(i+1),q_cprime(i+1),q_p(i+1),q_pprime(i+1));
t1_temp = t(i);
t2_temp = t(i+1);
v_t = [t1_temp t2_temp];
v_cs = [c1_temp c2_temp];
cs_n2(i)=c1_temp;
if i == 36
    cs_n2(i+1) = c2_temp;
end

figure(3);
color = 'r';
p2 = plot(v_t,v_cs,'b','LineWidth', 2);

end

%Calculation and plotting of cs(for n_a = 1)
for i = 1: (length(t)-1)
c1_temp = cs(1,q_c(i),q_cprime(i),q_p(i),q_pprime(i));
c2_temp = cs(1,q_c(i+1),q_cprime(i+1),q_p(i+1),q_pprime(i+1));
t1_temp = t(i);
t2_temp = t(i+1);
v_t = [t1_temp t2_temp];
v_cs = [c1_temp c2_temp];
cs_n1(i)=c1_temp;
if i == 36
    cs_n1(i+1) = c2_temp;
end

figure(3);
color = 'b';
p1 = plot(v_t,v_cs,'r','LineWidth', 2);

end
hold off
legend([p1,p2],'n_a = 1','n_a = 2');

%Calculation of the average adventage a_p of n_a = 1 to n_a= 2
 temp_c1 = 0;
 temp_c2 = 0;
for i=1:length(t)
    temp_c1 = temp_c1 + cs_n1(i);
    temp_c2 = temp_c2 + cs_n2(i);
end
a_p = (100/temp_c1)*temp_c2-100;
disp(a_p);

%Storing data to of cs to "Daytime_cs" and a_p
fid=fopen('Daytime_cs','w+')
fprintf(fid,'Daytime:         ');
fprintf(fid,'cs(n_a=1):       ');
fprintf(fid,'cs(n_a=2):     ');
fprintf(fid,'\n');

for i = 1:length(t)
        fprintf(fid,'%e     ',t(i));
        fprintf(fid,'%e     ',cs_n1(i));
        fprintf(fid,'%e     ',cs_n2(i));
        fprintf(fid,'\n');
end
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'a_p= ');
fprintf(fid,'%e     ',a_p);

fclose(fid);


