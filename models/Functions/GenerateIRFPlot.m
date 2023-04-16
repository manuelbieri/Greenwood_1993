function GenerateIRFPlot
%GENERATEIRFPLOT Packs the IRF plots of all four log-transformed models
% into one plot.

CleanUp;

% Retrieve the IRFs from the models
dynare Model1_log
irf1 = evalin('caller','oo_.irfs'); % irf of dynare output from workspace
dynare Model2_log
irf2 = evalin('caller','oo_.irfs'); % irf of dynare output from workspace
dynare Model3_log
irf3 = evalin('caller','oo_.irfs'); % irf of dynare output from workspace
dynare Model4_Log
irf4 = evalin('caller','oo_.irfs'); % irf of dynare output from workspace


for j=1:2
    clf;
    for i=1:4 % loop over different irfs (total consumption, output,...)
    subplot(2,2,i)
    % set title of subplot
    switch i
    case 1
        title("Total Consumption")
    case 2
        title("Total Investment")
    case 3
        title("Hours Worked")
    otherwise
        title("Output")
    end
    % plot all IRFs into one subplot
    hold on
    for irf=[irf1, irf2, irf3, irf4]
        switch i
        case 1
            switch j
            case 1
                plot(irf.C_eh);
            otherwise
                plot(irf.C_em);
            end
        case 2
            switch j
            case 1
                plot(irf.x_eh);
            otherwise
                plot(irf.x_em);
            end
        case 3
            switch j
            case 1
                plot(irf.hm_eh);
            otherwise
                plot(irf.hm_em);
            end
        otherwise
            switch j
            case 1
                plot(irf.y_eh);
            otherwise
                plot(irf.y_em);
            end
        end
    end
    % set subplot legend
    legend("Model 1", "Model 2", "Model 3", "Model 4");
    hold off
    end
    % save plot to image
    switch j
    case 1
        exportgraphics(gcf,'Files/irfs_eh.png','Resolution',300);
    otherwise
        exportgraphics(gcf,'Files/irfs_em.png','Resolution',300);
    end
end
end

