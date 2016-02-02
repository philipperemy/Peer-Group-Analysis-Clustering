function [ out ] = PeerGroup( X, time_j, i, npeer)
    sij = Statistic(X(:,i), time_j);
    d = size(X,2);
    s = [];
    for it = 1:d
        s(end+1) = DissimilarityMeasure(sij, Statistic(X(:,it), time_j));
    end;
    [~,I] = sort(s);
    out = I(2:(1+npeer));
end

