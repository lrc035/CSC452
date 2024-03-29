numLabs = 8;
np = 1e7;
nd = 2;

hp = gcp('nocreate');

if ~(isempty(hp))
	delete(hp);
end

hp = parpool(numLabs);

tic;
spmd
    a = randn(np/numLabs,nd);
    b = randn(np/numLabs,nd);
    c = zeros(np/numLabs,1);
    
    for i = 1:np/numLabs
        for j = 1:nd
            c(i) = c(i) + (b(i,j)-a(i,j)).^2;
        end
        c(i) = sqrt(c(i));
    end
    ca = gcat(c,1,1);
end

runtime = toc;
c1 = ca{1};
delete(hp);

fprintf('Runtime - %7.4f seconds \n', runtime)