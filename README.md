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

## Naming Conventions
The naming convention of the units is a prefix indicating what kind of unit,
an underscore, and the the S.I. code for the unit (if applicable) or a common
abbreviation (eg. vel_mph for velocity in mile per hour).  Since "/" is not
valid in indentifiers, it will be replaced by an underscore (eg vel_m_s) for
velocity in meters per second.  Exponentiation is indicated by a number (eg
accel_m_s2).

## Contents
Index of type prefixes:
* Length types.  Prefix := "len".  Base unit is meters.
* Area types.  Prefix := "area".  Base unit is meters^2.
* Volume types.  Prefix := "vol".  Base unit is liters.
* Temperature types.  Prefix := "temp".  Base unit is celsius.
* Pressure types.  Prefix := "press".  Base unit is pascal.
* Velocity types.  Prefix := "vel".  Base unit is m/s.
* Acceleration types.  Prefix := "accel".  Base unit is m/(s^2).
* Angular type.  Prefix := "ang".  Base unit is radians.
* Rotation rate types.  Prefix := "rot".  Base unit is radians/second.
* Magnetic types.  Prefix := "mag".  Base unit is Gauss.
* Electromotive force types.  Prefix := "emf".  Base unit is Volt.
* Electrical current types.  Prefix := "curr".  Base unit is Amper.
* Electrical resistance types.  Prefix := "res".  Base unit is Ohms.
* Frequency types. Prefix := "freq".  Base unit is Hertz.
* Time types.  Prefix := "time".  Base unit is Seconds.

## Adding Units
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

# Copying
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>

I have made some attempt to make sure that the conversions are accurate, but
there are no guarentees.  If you use this, you need to make sure that it is
suitable for your use.  This includes ensuring that the type have the required
accuracy.

## Updates
If you find an error or wish to have more units, conversions, or operations
added, drop me a line and I'll try and work them in here.
