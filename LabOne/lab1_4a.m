numLabs = 8;
np = 1e6;
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

t = toc;
c1 = ca{1};

delete(hp);