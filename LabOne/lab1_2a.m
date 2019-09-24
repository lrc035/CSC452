numWorkers = 1;
powers = [3,5,7];
runTime = zeros(size(powers,1),2);

hp = gcp('nocreate');

if ~(isempty(hp))
	delete(hp);
end

hp = parpool(numWorkers);
counter = 1;
for power = powers
   np = 1*10.^power;
   
   runTime(counter,1) = np;
   nd = 2;
   a = randn(np,nd);
   b = randn(np,nd);
   c = zeros(np,1);
   
    tic;
    parfor i=1:np
        for j= 1:nd
            c(i) = c(i) + (b(i,j)-a(i,j)).^2;
        end
        c(i) = sqrt(c(i));
    end
    runTime(counter,2) = toc;
    counter = counter + 1;
end

plot(runTime(:,1),runTime(:,2), '-o'),xlabel('Distance Values Calculated'),
ylabel('Time (s)'), 
title(['Run Time with ', num2str(numWorkers), ' Workers'])