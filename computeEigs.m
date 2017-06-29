function [ eigvecs, eigvals ] = computeEigs( symm_matrix, num_components )
%COMPUTEEIGS Summary of this function goes here
%   current implementation using matlab eigs

optis.issymm = true;
optis.disp = 2;
optis.tol = 1e-8;
optis.maxit = 1500;
optis.p = min(200, size(symm_matrix,1));

disp('Starting eigenvalue solving')
[eigvecs, eigvals, flag] = eigs(symm_matrix, num_components, 'LM', optis);
disp('Eigenvalue solving finished, complete convergence: ' + string(not(boolean(flag))))

end

