clear
clc

N = 1000; %number of observations.
d = 100; %length of sequence of values.
npeer = 30;

rng(42);
X = rand(N, d)-0.5;
X = cumsum(X);
plot(X);
hold on;
i = 1;
distort = 100;
X(:,i) = [-cumsum(repmat(0.1,distort,i)); X((distort+1):N,i)];
plot(X(:,i));
title('Population of the different Time Series');
drawnow;

scores = [];
for time = 1:N
    pg = PeerGroup( X, time, i, npeer);
    [Pij, Vij] = CentroidPeerGroup( X, pg, time );
    Sij = Statistic(X(:,i), time);
    score = Score(Sij, Pij, Vij);
    fprintf('done for time %d\n', time);
    scores(end+1) = score;
end

figure;
plot((X(:,1) - mean(X(:,1)))/std(X(:,1)));
hold on;
plot(scores);
legend('norm TS', 'score');
title('The Time Series of interest and its related PGA score');