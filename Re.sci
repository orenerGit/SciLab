// Scilab ( http://www.scilab.org/ )
// This file is hereby licensed under the terms of the GNU GPL v2.0,

//Reynolds number - ratio of inertial forces to viscous forces
//ρ (rho)is the density of the fluid (SI units: kg/m3) [3]
//U is the flow speed (m/s) [1]
//L is a characteristic linear dimension (m) [2]
//μ (nu) == ν/ρ is the dynamic viscosity of the fluid (Pa·s or N·s/m2 or kg/(m·s)) [3]
//ν (ni) is the kinematic viscosity of the fluid (m2/s) [4]

funcprot(0);    //functions protection mode, == 0 nothing special is done when a function is redefined
function [Re]=Re(varargin)
    rhs=size(varargin)
    // 2 < Number of input arguments <= 4
    if rhs<3 | rhs>4 then
        error(msprintf(gettext("%s: Wrong number of input arguments: Must be %d or %d.\n"),"Re",3,4));
    end
    if rhs==3 then
        U=varargin(1);
        L=varargin(2);
        nu=varargin(3);
        mprintf(gettext('Flow speed U: %f [m/s]\n'),varargin(1));
        mprintf(gettext('Characteristic linear dimension L: %f [m]\n'),varargin(2));
        mprintf(gettext('Dynamic viscosity of the fluid: %f [Pa·s or N·s/m2 or kg/(m·s)]\n\n'),varargin(3));
    end
    if rhs==4 then
        U=varargin(1);
        L=varargin(2);
        rho=varargin(3);
        nu=varargin(4)/varargin(3);
        mprintf(gettext('Flow speed U: %f [m/s]\n'),varargin(1));
        mprintf(gettext('Characteristic linear dimension L: %f [m]\n'),varargin(2));
        mprintf(gettext('Density of the fluid : %f [kg/m3]\n'),varargin(3));
        mprintf(gettext('Kinematic viscosity of the fluid : %f [m2/s]\n\n'),varargin(4));
    end
    Re = U*L/nu;
    mprintf(gettext('Reynolds number : %e \n'),Re);
endfunction
funcprot(1);    //functions protection mode, == 1 warning message when a function is redefined (default mode)
