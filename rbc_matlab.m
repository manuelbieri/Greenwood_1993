clear all;
close all;
clc;

% Here is a little example on how to access the elements of oo_ which stores the results of
% dynare. 

% To access IRFs from a dynare file for example:

% First you must run a model, for example:
dynare rbcNonLinearLogsDeflated 

% Then you can access (among the objects in  oo_) the irf for a particular
% variable, say y (output): 
irf_y         = oo_.irfs.y_egam;
% or for c (consumption)
irf_c         = oo_.irfs.c_egam;
% etc. 

% You can then plot these either in separate subplots: 
figure(2);
subplot(1,2,1);plot(irf_y);legend('y');
subplot(1,2,2);plot(irf_c);legend('c');
%etc.

% or in one figure:
figure(3)
plot([irf_y', irf_c']);legend('output', 'consumption')
% etc. 

% This is just a basic illustration on how you can create figures according
% to your needs and ideas. 