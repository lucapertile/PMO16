function  playoutBuffer( lambda, muVideo, muOtherEvents, nSteps  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if (nargin==0)
    lambda = 50; muVideo = 1/0.0075; muOtherEvents=1/0.014; nSteps = 100;
end

% Initialisation

tArrivalsOtherEvents = zeros(nSteps,1);

i = 0;
tArrivalsDeterministic = zeros(100,1);
nArrivalsDeterministic=0;
nArrivalsPoisson=0;
elapsedTimePoisson =0;
videoLength = 100; %length of the video in packets
elapsedTimeDeterministic =0;
deterministicTime = 0.02; %the packets arrive every 0.02 time units
 
%stop when we have collected 100 packets in the array with the
%deterministic packets
while(nArrivalsDeterministic <  videoLength || elapsedTimePoisson <= deterministicTime*videoLength)
    
    
     %service times can either exponentially distributed or deterministic
     %depending on the type of packet that we get
 
    elapsedTimeDeterministic = elapsedTimeDeterministic + deterministicTime;
    nArrivalsDeterministic = nArrivalsDeterministic + 1;
    tArrivalsDeterministic(nArrivalsDeterministic) = elapsedTimeDeterministic;
    
    
    poissonTime = exprnd(1/(lambda)); % exp distributed random variable for the arrival time 
    elapsedTimePoisson = elapsedTimePoisson + poissonTime;
    % an event arrives from the Poisson stream
    nArrivalsPoisson = nArrivalsPoisson + 1;
    tArrivalsOtherEvents(nArrivalsPoisson) = elapsedTimePoisson;
   
end

%merge the arrays into a single time line

tBufferTimeline= zeros(max(nArrivalsPoisson,nArrivalsDeterministic),1);

for k = 1:max(nArrivalsPoisson,nArrivalsDeterministic)
   
   poissonServiceTime = exprnd(1/(muOtherEvents));
    
   if tArrivalsOtherEvents(k)< tArrivalsDeterministic(k)
    
   tBufferTimeline(k)=py.tuple({,'Biology'}) 
    
end




tArrivalsOtherEvents
tArrivalsDeterministic


end

