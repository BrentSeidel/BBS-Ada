--
-- Author: Brent Seidel
-- Version: V00.01
-- Date: 6-Apr-2016
--
-- This package defines a number of types for physical units.  These are
-- generally based off of the Float type since in most cases, 6 digits is
-- pretty good for a physical measurement.  If you need more precision, go
-- ahead and change it to whatever you need.
--
-- Conversion routines are provided to convert between different units.  Due to
-- the number of different units, conversion between two may not be directly
-- possible, but should be possible through intermediate units.  The ones present
-- are the ones that I use most.  More will probably be added in the future.  For
-- each type of measurement, there is a base unit.  Conversions to and from this
-- unit to other units are provided.
--
-- While addition and subtraction of units generally provides a meaningful result,
-- multiplication and division may not.  For example meters*meters should provide
-- a result in meters^2.  In some cases (ones that I use) multiplication and
-- division will be provided.  Most of these routines are trivial and can be
-- added as needed.
--
-- Ada provides Ada.Calendar to cover time related items.  Therefor, there is
-- not much time support here.
--
-- The naming convention of the units is a prefix indicating what kind of unit,
-- an underscore, and the the S.I. code for the unit (if applicable) or a common
-- abbreviation (eg. vel_mph for velocity in mile per hour).  Since "/" is not
-- valid in indentifiers, it will be replaced by an underscore (eg vel_m_s) for
-- velocity in meters per second.  Exponentiation is indicated by a number (eg
-- accel_m_s2).
--
-- License:
-- This is free and unencumbered software released into the public domain.
--
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any
-- means.
--
-- In jurisdictions that recognize copyright laws, the author or authors
-- of this software dedicate any and all copyright interest in the
-- software to the public domain. We make this dedication for the benefit
-- of the public at large and to the detriment of our heirs and
-- successors. We intend this dedication to be an overt act of
-- relinquishment in perpetuity of all present and future rights to this
-- software under copyright law.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.
--
-- For more information, please refer to <http://unlicense.org>
--
--
with Ada.Numerics;
package BBS.units with SPARK_Mode => on is
   --
   -- Index of type prefixes:
   -- Length types.  Prefix := "len".  Base unit is meters.
   -- Area types.  Prefix := "area".  Base unit is meters^2.
   -- Volume types.  Prefix := "vol".  Base unit is liters.
   -- Mass types.  Prefix := "mass".  Base unit is kilograms.
   -- Force types.  Prefix := "force".  Base unit is newtons.
   -- Temperature types.  Prefix := "temp".  Base unit is celsius.
   -- Pressure types.  Prefix := "press".  Base unit is pascal.
   -- Velocity types.  Prefix := "vel".  Base unit is m/s.
   -- Acceleration types.  Prefix := "accel".  Base unit is m/(s^2).
   -- Angular type.  Prefix := "ang".  Base unit is radians.
   -- Rotation rate types.  Prefix := "rot".  Base unit is radians/second.
   -- Magnetic types.  Prefix := "mag".  Base unit is Gauss.
   -- Electromotive force types.  Prefix := "emf".  Base unit is Volt.
   -- Electrical current types.  Prefix := "curr".  Base unit is Amper.
   -- Electrical resistance types.  Prefix := "res".  Base unit is Ohms.
   -- Frequency types. Prefix := "freq".  Base unit is Hertz.
   -- Time types.  Prefix := "time".  Base unit is Seconds.
   --
   -- Forward declaration of types, as needed.
   --
   type vel_m_s;
   type accel_m_s2;
   --
   -- Length types.  Prefix := "len".  Base unit is meters.
   --
   -- length in meters
   type len_m is new Float;
   -- length in feet
   type len_ft is new Float;
   -- length in Ångstroms
   type len_Å is new Float;
   --
   function to_feet(dist : len_m) return len_ft
     with
       Global => null;
   function to_Ångstroms(dist : len_m) return len_Å
     with
       Global => null;
   function to_meters(dist : len_ft) return len_m
     with
       Global => null;
   function to_meters(dist : len_Å) return len_m
     with
       Global => null;
   --
   function "/"(Left : len_m; Right : Duration) return vel_m_s
     with
       Global => null,
       pre => (Right /= 0.0);
   --
   -- Area types.  Prefix := "area".  Base unit is meters^2.
   --
   -- area in square meters
   type area_m2 is new Float;
   -- With only one unit, there are no conversion functions.
   function "*"(Left, Right : len_m) return area_m2
     with
       Global => null;
   --
   -- Volume types.  Prefix := "vol".  Base unit is liters.
   --
   -- volume in liters
   type vol_l is new Float;
   -- volume in cubic meters
   type vol_m3 is new Float;
   --
   function to_liters(vol : vol_m3) return vol_l
     with
       Global => null;
   function to_meters3(vol : vol_l) return vol_m3
     with
       Global => null;
   function "*"(Left : len_m; Right : area_m2) return vol_m3
     with
       Global => null;
   function "*"(Left : area_m2; Right : len_m) return vol_m3
     with
       Global => null;
   --
   -- Mass types.  Prefix := "mass".  Base unit is kilograms.
   --
   -- mass in kilograms
   type mass_kg is new Float;
   -- mass in pounds
   type mass_lb is new Float;
   --
   function to_pounds(mass : mass_kg) return mass_lb
     with
       Global => null;
   function to_kilograms(mass : mass_lb) return mass_kg
     with
       Global => null;
   --
   -- Force types.  Prefix := "force".  Base unit is newtons.
   --
   -- force in newtons
   type force_n is new Float;
   -- with no other units there are no conversion functions
   -- Newtons law, F=MA
   function "*"(Left : mass_kg; Right : accel_m_s2) return force_n
     with
       Global => null;
   function "*"(Left : accel_m_s2; Right : mass_kg) return force_n
     with
       Global => null;
   function "/"(Left : force_n; Right : accel_m_s2) return mass_kg
     with
       Global => null,
       pre => (Right /= 0.0);
   function "/"(Left : force_n; Right : mass_kg) return accel_m_s2
     with
       Global => null,
       pre => (Right /= 0.0);
   --
   -- Temperature types.  Prefix := "temp".  Base unit is celsius.
   --
   -- temperature in kelvin
   type temp_k is new Float;
   -- temperature in celsius
   type temp_c is new Float;
   -- temperature in farenheit
   type temp_f is new Float;
   --
   function to_Farenheit(temp : temp_c) return temp_f
     with
       Global => null;
   function to_Kelvin(temp : temp_c) return temp_k
     with
       Global => null;
   function to_Celsius(temp : temp_f) return temp_c
     with
       Global => null;
   function to_Celsius(temp : temp_k) return temp_c
     with
       Global => null;
   --
   -- Pressure types.  Prefix := "press".  Base unit is pascal.
   --
   -- pressure in pascals
   type press_p is new Float;
   -- pressure in millibars
   type press_mb is new Float;
   -- pressure in atmospheres
   type press_atm is new Float;
   -- pressure in inches of mercury
   type press_inHg is new Float;
   --
   function to_milliBar(pressure : press_p) return press_mb
     with
       Global => null;
   function to_Atmosphere(pressure : press_p) return press_atm
     with
       Global => null;
   function to_inHg(pressure : press_p) return press_inHg
     with
       Global => null;
   function to_Pascal(pressure : press_mb) return press_p
     with
       Global => null;
   function to_Pascal(pressure : press_atm) return press_p
     with
       Global => null;
   function to_Pascal(pressure : press_inHg) return press_p
     with
       Global => null;
   --
   -- Velocity types.  Prefix := "vel".  Base unit is m/s.
   --
   -- velocity in meters/second
   type vel_m_s is new Float;
   -- velocity in miles per hour
   type vel_mph is new Float;
   -- velocity in kilometers/hour
   type vel_km_h is new Float;
   -- velocity in knots
   type vel_knots is new Float;
   --
   function to_mph(vel : vel_m_s) return vel_mph
     with
       Global => null;
   function to_km_h(vel : vel_m_s) return vel_km_h
     with
       Global => null;
   function to_knots(vel : vel_m_s) return vel_knots
     with
       Global => null;
   function to_m_s(vel : vel_knots) return vel_m_s
     with
       Global => null;
   function to_m_s(vel : vel_km_h) return vel_m_s
     with
       Global => null;
   function to_m_s(vel : vel_mph) return vel_m_s
     with
       Global => null;
   --
   function "*"(Left : vel_m_s; Right : Duration) return len_m
     with
       Global => null;
   function "*"(Left : Duration; Right : vel_m_s) return len_m
     with
       Global => null;
   function "/"(Left : vel_m_s; Right : Duration) return accel_m_s2
     with
       Global => null,
       pre => (Right /= 0.0);
   --
   -- Acceleration types.  Prefix := "accel".  Base unit is m/(s^2).
   --
   -- acceleration in meters per second squared
   type accel_m_s2 is new Float;
   -- acceleration in units of Earth gravity
   type accel_g is new Float;
   --
   function to_m_s2(accel : accel_g) return accel_m_s2
     with
       Global => null;
   function to_g(accel : accel_m_s2) return accel_g
     with
       Global => null;
   --
   function "*"(Left : accel_m_s2; Right : Duration) return vel_m_s
     with
       Global => null;
   function "*"(Left : Duration; Right : accel_m_s2) return vel_m_s
     with
       Global => null;
   --
   -- Angular type.  Prefix := "ang".  Base unit is radians.
   --
   -- angle in radians
   type ang_r is new Float;
   -- angle in degrees
   type ang_d is new Float;
   --
   function to_degrees(ang : ang_r) return ang_d
     with
       Global => null;
   function to_radians(ang : ang_d) return ang_r
     with
       Global => null;
   --
   -- Rotation rate types.  Prefix := "rot".  Base unit is radians/second.
   --
   -- rotation in radians per second
   type rot_r_s is new Float;
   -- rotation in degrees per second
   type rot_d_s is new Float;
   --
   function to_r_s(rot : rot_d_s) return rot_r_s
     with
       Global => null;
   function to_d_s(rot : rot_r_s) return rot_d_s
     with
       Global => null;
   --
   function "*"(Left : rot_d_s; Right : Duration) return ang_d
     with
       Global => null;
   function "*"(Left : Duration; Right : rot_d_s) return ang_d
     with
       Global => null;
   --
   -- Magnetic types.  Prefix := "mag".  Base unit is Gauss.
   --
   -- magnetic field in gauss
   type mag_g is new Float;
   -- With only one unit, there are no conversions functions.
   --
   -- Electromotive force types.  Prefix := "emf".  Base unit is Volt.
   --
   -- electromotive force in volts
   type emf_v is new Float;
   -- With only one unit, there are no conversion functions.
   --
   -- Electrical current types.  Prefix := "curr".  Base unit is Amper.
   --
   -- electrical current in amps
   type curr_a is new Float;
   -- With only one unit, there are no conversions functions.
   --
   -- Electrical resistance types.  Prefix := "res".  Base unit is Ohms.
   type res_o is new Float;
   --
   -- Variations of Ohms law
   --
   function "*"(Left : curr_a; Right : res_o) return emf_v
     with
       Global => null;
   function "*"(Left : res_o; Right : curr_a) return emf_v
     with
       Global => null;
   function "/"(Left : emf_v; Right : curr_a) return res_o
     with
       Global => null,
       pre => (Right /= 0.0);
   function "/"(Left : emf_v; Right : res_o) return curr_a
     with
       Global => null,
       pre => (Right /= 0.0);
   --
   -- Frequency types.  Prefix := "freq".  Base unit is Hertz.
   -- Time types. Prefix := "time".  Base unit is Seconds.
   --
   -- Note that Ada has a predefined Duration type that is a fixed point type
   -- Seconds is defined as a subtype of this.  The other times (minutes and
   -- hours) are derivative types so as to maintain similar precision.  If needed,
   -- they could be changed to Float or something else.
   --
   -- frequency in Herts
   type freq_hz is new Float;
   -- time in seconds (use subtype because seconds is identical to duration)
   subtype time_s is Duration;
   -- time in minutes
   type time_m is new Duration;
   -- time in hours
   type time_h is new Duration;
   --
   function to_hz(period : time_s) return freq_hz
     with
       Global => null;
   function to_minutes(period : time_s) return time_m
     with
       Global => null;
   function to_hours(period : time_s) return time_h
     with
       Global => null;
   function to_seconds(freq : freq_hz) return time_s
     with
       Global => null;
   function to_seconds(period : time_m) return time_s
     with
       Global => null;
   function to_seconds(period : time_h) return time_s
     with
       Global => null;
   --

end;
