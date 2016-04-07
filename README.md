# BBS-Ada
The root package for all of my Ada library projects.  It doesn't contain much of
anything by itself.  It only exists to provide the root namespace.  My other
projects will be bbs.<something>.

This repository also contains some basic packages that are used by multiple other
projects.  Currently, the following packages are included.

# BBS-units
This package contains definitions and conversions for various physical units.
The definitions are based off of Float which gives adequate precision for most
physical measurements.  If you are doing better than that, you probably know
what you are doing and can adjust things to suit.

Note that since the number of units is large and the number of useful combinations
is even larger, it is inevitable that some units are left out.  The good news is
that it's fairly easy to grab the code and add your favorites.  For example if you
want to add furlongs per fortnight as a velocity, you would add the following to
the .ads file:
type vel_fur_ftn is new Float;
function to_m_s(vel : vel_fur_ftn) return vel_m_s;
function to_fur_ftn(vel : vel_m_s) return vel_fur_ftn;

Then add the following two functions to the appropriate section in the .adb file
(actually, you can add them most any where, but it will be easier to find if you
put them with the other velocity conversions):
    -- Conversion factor found by google.
    function to_m_s(vel : vel_fur_ftn) return vel_m_s is
    begin
       return vel_m_s(float(vel) / 6012.87);
    end;
    --
    function to_fur_ftn(vel : vel_m_s) return vel_fur_ftn is
    begin
       return vel_fur_ftn(float(vel) * 6012.87);
    end;

That's basically it.  If you want to be able to divide furlongs by fortnights and
get furlongs per fortnight, or multiply furlongs per fortnight by fortnights and
get furlongs back, you will need to do a little extra work.  Look through the
code for examples.

