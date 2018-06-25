%% -------------------------------------------------------------------
% Universite Jean Monnet
% Computer Vision
% Practical Session 1
% Evelyn Paiz Reyes
% Nadile Nunes
% Description: Obtains the n most prominent points of a matrix M
%% -------------------------------------------------------------------

function features = getP(M, n)
    % Use "sort" and "ind2sub" to get the coordinates of the
    % n points that we are looking for
    [sortM, Index] = sort(M(:), 'descend');
    [X, Y] = ind2sub(size(M), Index(1:n));
    
    % Now the coords are converted into cells
    cX = num2cell(X);
    cY = num2cell(Y);
    
    % The n features are saved
    [features(1:n).px] = deal(cX{:});
    [features(1:n).py] = deal(cY{:});
end