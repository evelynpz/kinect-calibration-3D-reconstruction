%% -------------------------------------------------------------------
% Universite Jean Monnet
% Computer Vision
% Practical Session 1
% Evelyn Paiz Reyes
% Nadile Nunes
% Description: Plots a set of points infront of an image
%% -------------------------------------------------------------------

function showP(I, features, t, type)
    imshow(mat2gray(I));
    set(gca,'YDir','Normal'); axis equal; axis tight;
    hold on; title(t);  
    for i=1:size(features,2)
        plot(features(i).px, features(i).py, type); 
    end
    hold off
end