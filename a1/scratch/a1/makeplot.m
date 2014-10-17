%% Analyze def1.txt files
% Plot the various responses

d = dir('*.deform1.txt');
for i = 1:length(d)
    % Get data
    fname = d(i).name;
    A = importdata(fname);
    strain = A.data(:,1);
    stress = A.data(:,2:4);

    % Generate plot
    plot(strain,stress(:,1),'-or','LineWidth',2,'MarkerEdgeColor','r',...
                'MarkerFaceColor','r','MarkerSize',5),hold on
    plot(strain,stress(:,2),'-ob','LineWidth',2,'MarkerEdgeColor','b',...
                'MarkerFaceColor','b','MarkerSize',5),hold on
    plot(strain,stress(:,3),'-og','LineWidth',2,'MarkerEdgeColor','g',...
                'MarkerFaceColor','g','MarkerSize',5),hold on
    axis square
    ylim([0 10])
    set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
    set(get(gca,'XLabel'),'String','Strain','FontSize',32,'FontWeight','bold','FontName','Times')
    set(get(gca,'YLabel'),'String','Stress (GPa)','FontSize',32,'FontWeight','bold','FontName','Times')
    set(gcf,'Position',[1 1 round(1000) round(1000)])

    % Export figure to tif file
    exportfig(gcf,strrep(fname,'.def1.txt','.tif'),'Format','tiff',...
    'Color','rgb','Resolution',300)
    close(1)

end

