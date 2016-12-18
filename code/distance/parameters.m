% Min.  Headway for pedestrians: The time interval [sec]  between of two successive 
% pedestrians
tau_p = 2;

% Min.  Headway for cars: The time interval between the arrivals of two successive 
% the vehicles in the Majorflow(from front to front);
tau_c = 2.2;

%For pedestrians
%Follow-up time: Time between the departure of one vehicle from the minor s
%treet and the departure of the next vehicle using the same gap under a 
%condition of continuous queuing.
t_fp = 3.2;

%For cars
%Follow-up time: Time between the departure of one vehicle from the minor s
%treet and the departure of the next vehicle using the same gap under a 
%condition of continuous queuing.
t_fc = 3.2;

%Critical gap: The minimum major-stream headway during which a minor-street 
%vehicle can make a maneuver.
%%t_Cc=Critical gap for cars
t_Cc= 4.5;

%t_Cp: Critical gap for pedestrians
t_Cp= 6.2;

%Intercept gap for cars: Mimimum physical gap  when one car from the 
%minorflow can merge into the majorflow
t_0c= t_Cc-(0.5*t_fc);

%Intercept gap for pedestrians: Mimimum physical gap when one car 
%from the minorflow can cross the majorflow(pedestrians)
t_0p= t_Cp-(0.5*t_fp);


%q_p := pedestrians crossing the crosswalk at the subject entrance [pedestrians/sec]
q_p=(1/3600)*100;

%q_m: Constant representing the minorflow at the entrance
q_m= (1/3600)*50;

%q_cprime := circulating flow infront of the main exit [cars/sec]
q_cprime= (1/3600)*400;

%q_pprime := pedestrians crossing the crosswalk at the main entrance [pedestrians/sec]
q_pprime=(1/3600)*50;

%q_m: Constant representing the minorflow at the main exit
q_mprime= (1/3600)*50;

%alpha_x: Propoation of demand of vehicles exiting the main exit X in
%circulating flow q_c
alpha_x = 0.2;

%Number of cars which can be stored between the entrance and the following
%exit. It defines the size of the roundabout
n_b= 2;
