function [ sij ] = Statistic( xi, j )
    %sij = tsmovavg(xi(1:j),'s', 1, 1);
    %sij = mean(diff(xi(1:j)).^2);
    sij = xi(j);
end

