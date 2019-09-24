numLabs = 4;
np = 1e6;
nd = 2;

hp = gcp('nocreate');

if ~(isempty(hp))
	delete(hp);
end

hp = parpool(numLabs);

tic;
spmd
    if (labindex == 1)
        a = randn(np,nd);
        b = randn(np,nd);
        c = b-a;
        labSend(c, 2);
    elseif (labindex == 2)
        c = labReceive(1);
        d = c.^2;
        labSend(d,3);
    elseif (labindex == 3)
        d = labReceive(2);
        e = sum(d,2);
        labSend(e,4);
    elseif (labindex == 4)
        e = labReceive(3);
        f = sqrt(e);
    end
end

t = toc;
d = f(4);
delete(hp);