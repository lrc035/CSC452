numLabs = 8;
np = 1e7;
nd = 2;

%hp = gcp('nocreate');

%if ~(isempty(hp))
%	delete(hp);
%end

%hp = parpool(numLabs);

A = randn(np,nd);
B = randn(np,nd);
dA = distributed(A);
dB = distributed(B);

tic;
dc = sqrt(sum((dB-dA).^2,2));
d = gather(dc);
runtime = toc;
%delete(hp);
fprintf('Runtime - %7.4f seconds \n', runtime)