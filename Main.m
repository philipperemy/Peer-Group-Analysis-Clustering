clear
clc

N = 1000; %number of observations.
d = 100; %length of sequence of values.
npeer = 30;

rng(42);
X = rand(N, d)-0.5;
X = cumsum(X);
plot(X);
drawnow;

i = 1;
distort = 100;
X(:,1) = [-cumsum(repmat(0.1,distort,1)); X((distort+1):N,1)];

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
