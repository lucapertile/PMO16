function  playoutBuffer( lambda, muVideo, muOtherEvents, nSteps  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if (nargin==0)
    lambda = 50; muVideo = 1/0.0075; muOtherEvents=1/0.014; nSteps = 100;
end

rho = lambda/mu;

% Initialisation
tResidence = zeros(nSteps+1,1);
tArrivals = zeros(nSteps,1);
tDepartures = zeros(nSteps,1);
tResponse = zeros(nSteps,1);
states = zeros(nSteps+1,1);

i = 0;

for k = 1:nSteps
    
     %service times can either exponentially distributed or deterministic
     %depending on the type of packet that we get
    time = exprnd(1/(lambda+mux)); % Time to the next transition
    elapsedTime = elapsedTime + time;

    if (rand < lambda/(lambda+muOtherEvents)) % We have an arrival ...
        nArrivals = nArrivals + 1;
        tArrivals(nArrivals) = elapsedTime;
        i = i + 1;
    else
        nCompletions = nCompletions + 1; % ... or a completion with probability mux/(lambda+mux)
        tDepartures(nCompletions) = elapsedTime;
        i = i - 1;
    end
    
end


end

