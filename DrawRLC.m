function DrawRLC(handles)
axes(handles.axes6)
type='RLC';
ax = gca;
cla(ax)
set(ax,'XLim',[0.0 1.7],'YLim',[0.9 1.9]);
resistor('Parent',ax,'Position',[0.3 1.7],'Size',0.5,'Angle',0);
inductor('Parent',ax,'Position',[0.8 1.7],'Size',0.5,'Angle',0);
capacitor('Parent',ax,'Position',[1.4 1.6],'Size',0.5,'Angle',-90);
wire('Parent',ax,'XData',[0.2 0.3 NaN 1.3 1.6 NaN 1.4 1.4 NaN 1.4 1.4 NaN 0.2 1.6],...
   'YData',[1.7 1.7 NaN 1.7 1.7 NaN 1.7 1.6 NaN 1.1 1.0 NaN 1.0 1.0]);
port('Parent',ax,'XData',[0.2 0.2],'YData',[1.7 1.0],'Name','Vin');
port('Parent',ax,'XData',[1.6 1.6],'YData',[1.7 1.0],'Name','Vout');
text('Parent',ax,'String',type(1),'Position',[0.55 1.555 0],...
   'FontSize',10,'FontWeight','bold','HorizontalAlignment','right','VerticalAlignment','top');
text('Parent',ax,'String',type(2),'Position',[1.05 1.555 0],...
   'FontSize',10,'FontWeight','bold','HorizontalAlignment','right','VerticalAlignment','top');
text('Parent',ax,'String',type(3),'Position',[1.25 1.30 0],...
   'FontSize',10,'FontWeight','bold','HorizontalAlignment','right','VerticalAlignment','top');
axis off
