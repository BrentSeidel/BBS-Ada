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
with Ada.Numerics;
package BBS.units is
   --
   -- Index of type prefixes:
   -- Length types.  Prefix := "len".  Base unit is meters
   -- Temperature types.  Prefix := "temp".  Base unit is celsius
   -- Pressure types.  Prefix := "press".  Base unit is pascal
   -- Velocity types.  Prefix := "vel".  Base unit is m/s
   -- Acceleration types.  Prefix := "accel".  Base unit is m/(s^2).
   -- Angular type.  Prefix := "ang".  Base unit is radians.
   -- Rotation rate types.  Prefix := "rot".  Base unit is radians/second
   -- Magnetic types.  Prefix := "mag".  Base unit is Gauss.
   -- Electromotive force types.  Prefix := "emf".  Base unit is Volt.
   -- Electrical current types.  Prefix := "curr".  Base unit is Amper.
   -- Electrical resistance types.  Prefix := "res".  Base unit is Ohms.
   --
   --
   -- Time types
   --
   -- duration in seconds
   -- type Duration is a built in type.  Use this.
   --
   -- Length types.  Prefix := "len".  Base unit is meters
   --
   -- length in meters
   type len_m is new Float;
   -- length in feet
   type len_ft is new Float;
   --
   function to_feet(dist : len_m) return len_ft;
   function to_meters(dist : len_ft) return len_m;
   --
   type vel_m_s; -- defined later in this file
   function "/"(Left : len_m; Right : Duration) return vel_m_s;
   --
   -- Temperature types.  Prefix := "temp".  Base unit is celsius
   --
   -- temperature in kelvin
   type temp_k is new Float;
   -- temperature in celsius
   type temp_c is new Float;
   -- temperature in farenheit
   type temp_f is new Float;
   --
   function to_Farenheit(temp : temp_c) return temp_f;
   function to_Kelvin(temp : temp_c) return temp_k;
   function to_Celsius(temp : temp_f) return temp_c;
   function to_Celsius(temp : temp_k) return temp_c;
   --
   -- Pressure types.  Prefix := "press".  Base unit is pascal
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
   function to_milliBar(pressure : press_p) return press_mb;
   function to_Atmosphere(pressure : press_p) return press_atm;
   function to_inHg(pressure : press_p) return press_inHg;
   function to_Pascal(pressure : press_mb) return press_p;
   function to_Pascal(pressure : press_atm) return press_p;
   function to_Pascal(pressure : press_inHg) return press_p;
   --
   -- Velocity types.  Prefix := "vel".  Base unit is m/s
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
   function to_mph(vel : vel_m_s) return vel_mph;
   function to_km_h(vel : vel_m_s) return vel_km_h;
   function to_knots(vel : vel_m_s) return vel_knots;
   function to_m_s(vel : vel_knots) return vel_m_s;
   function to_m_s(vel : vel_km_h) return vel_m_s;
   function to_m_s(vel : vel_mph) return vel_m_s;
   --
   type accel_m_s2; -- defined later in this file
   function "*"(Left : vel_m_s; Right : Duration) return len_m;
   function "*"(Left : Duration; Right : vel_m_s) return len_m;
   function "/"(Left : vel_m_s; Right : Duration) return accel_m_s2;
   --
   -- Acceleration types.  Prefix := "accel".  Base unit is m/(s^2).
   --
   -- acceleration in meters per second squared
   type accel_m_s2 is new Float;
   -- acceleration in units of Earth gravity
   type accel_g is new Float;
   --
   function to_m_s2(accel : accel_g) return accel_m_s2;
   function to_g(accel : accel_m_s2) return accel_g;
   --
   function "*"(Left : accel_m_s2; Right : Duration) return vel_m_s;
   function "*"(Left : Duration; Right : accel_m_s2) return vel_m_s;
   --
   -- Angular type.  Prefix := "ang".  Base unit is radians.
   --
   -- angle in radians
   type ang_r is new Float;
   -- angle in degrees
   type ang_d is new Float;
   --
   function to_degrees(ang : ang_r) return ang_d;
   function to_radians(ang : ang_d) return ang_r;
   --
   -- Rotation rate types.  Prefix := "rot".  Base unit is radians/second.
   --
   -- rotation in radians per second
   type rot_r_s is new Float;
   -- rotation in degrees per second
   type rot_d_s is new Float;
   --
   function to_r_s(rot : rot_d_s) return rot_r_s;
   function to_d_s(rot : rot_r_s) return rot_d_s;
   --
   function "*"(Left : rot_d_s; Right : Duration) return ang_d;
   function "*"(Left : Duration; Right : rot_d_s) return ang_d;
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
   function "*"(Left : curr_a; Right : res_o) return emf_v;
   function "*"(Left : res_o; Right : curr_a) return emf_v;
   function "/"(Left : emf_v; Right : curr_a) return res_o;
   function "/"(Left : emf_v; Right : res_o) return curr_a;
   --
   -- Frequency types.  Prefix := "freq".  Base unit is Hertz
   --
   -- frequency in Herts
   type freq_hz is new Float;
   --
   function to_hz(period : Duration) return freq_hz;
   function to_seconds(freq : freq_hz) return Duration;
   --

end;
