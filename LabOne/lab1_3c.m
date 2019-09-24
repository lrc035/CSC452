powers = [1,3,5,7];
runTime = zeros(size(powers,1),2);

counter = 1;
for power = powers
    
    fprintf('\tPowers\t\tRun time(s)\n')
    np = 1*10.^power;
   
    runTime(counter,1) = np;
    nd = 2;
    a = randn(np,nd);
    b = randn(np,nd);
    c = zeros(np,1);
   
    tic;
    for i=1:np
        for j= 1:nd
            c(i) = c(i) + (b(i,j)-a(i,j)).^2;
        end
        c(i) = sqrt(c(i));
    end
    runTime(counter,2) = toc;
    fprintf('/t%d\t\t%7.2f\n',power, runTime(counter,2))
    counter = counter + 1;
end