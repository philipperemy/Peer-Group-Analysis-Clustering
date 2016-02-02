function [ Tij ] = Score( target_Sij, mean_centroid, variance_centroid )
    Tij = ( target_Sij - mean_centroid) / sqrt(variance_centroid);
end

