function [ mean_centroid, var_centroid ] = CentroidPeerGroup( X, peerGroup, time_j )
    npeer = length(peerGroup);
    stats = [];
    for i = 1:npeer
        stats(end+1) = Statistic(X(:,i), time_j);
    end
    
    mean_centroid = mean(stats);
    var_centroid = var(stats);
    
    %mean_centroid = 1 / npeer * sum(stats);
    %dot product.
    %centered_stats = stats - mean_centroid;
    %var_centroid = 1 / ( npeer - 1 ) * dot(centered_stats, centered_stats);
end

