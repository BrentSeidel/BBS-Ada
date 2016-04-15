--
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
package body BBS.units is
   --
   -- Unit conversion routines.  Most of these are pretty simple.  Add as needed.
   -- The conversion factors come from a variety of sources and definitions.
   --
   -- -------------------------------------------------------------------------
   -- *** Distance conversions ***
   --
   function to_feet(dist : len_m) return len_ft is
   begin
      return len_ft(float(dist) * 3.28084);
   end;
   --
   function to_Ångstroms(dist : len_m) return len_Å is
   begin
      return len_Å(Float(dist) * 10_000_000_000.0);
   end;
   --
   function to_meters(dist : len_ft) return len_m is
   begin
      return len_m(float(dist) / 3.28084);
   end;
   --
   function to_meters(dist : len_Å) return len_m is
   begin
      return len_m(dist / 10_000_000_000.0);
   end;
   --
   -- Length functions
   --
   function "/"(Left : len_m; Right : Duration) return vel_m_s is
   begin
      return vel_m_s(Float(Left) / Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Area conversions ***
   --
   --
   -- Area functions
   --
   function "*"(Left, Right : len_m) return area_m2 is
   begin
      return area_m2(Float(Left) * Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Volume conversions ***
   --
   function to_liters(vol : vol_m3) return vol_l is
   begin
      return vol_l(vol * 1000.0);
   end;
   --
   function to_meters3(vol : vol_l) return vol_m3 is
   begin
      return vol_m3(vol / 1000.0);
   end;
   --
   -- Volume functions
   --
   function "*"(Left : len_m; Right : area_m2) return vol_m3 is
   begin
      return vol_m3(Float(Left) * Float(right));
   end;
   --
   function "*"(Left : area_m2; Right : len_m) return vol_m3 is
   begin
      return vol_m3(Float(Left) * Float(right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Mass conversions ***
   --
   function to_pounds(mass : mass_kg) return mass_lb is
   begin
      return mass_lb(Float(mass) / 0.4535924);
   end;
   --
   function to_kilograms(mass : mass_lb) return mass_kg is
   begin
      return mass_kg(Float(mass) * 0.4535924);
   end;
   -- -------------------------------------------------------------------------
   -- *** Force conversions ***
   --
   -- none
   --
   -- Force functions
   --
   function "*"(Left : mass_kg; Right : accel_m_s2) return force_n is
   begin
        return force_n(Float(Left) * Float(Right));
   end;
   --
   function "*"(Left : accel_m_s2; Right : mass_kg) return force_n is
   begin
        return force_n(Float(Left) * Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Temperature conversions ***
   --
   function to_Farenheit(temp : temp_c) return temp_f is
   begin
      return temp_f(float(temp)*9.0/5.0 + 32.0);
   end;
   --
   function to_Kelvin(temp : temp_c) return temp_k is
   begin
      return temp_k(float(temp) + 273.15);
   end;
   --
   function to_Celsius(temp : temp_f) return temp_c is
   begin
      return temp_c(float(temp - 32.0)*5.0/9.0);
   end;
   --
   function to_Celsius(temp : temp_k) return temp_c is
   begin
      return temp_c(float(temp) - 273.15);
   end;
   -- -------------------------------------------------------------------------
   -- *** Pressure conversions ***
   --
   function to_milliBar(pressure : press_p) return press_mb is
   begin
      return press_mb(float(pressure) / 100.0);
   end;
   --
   function to_Atmosphere(pressure : press_p) return press_atm is
   begin
      return press_atm(float(pressure) / 101325.0);
   end;
   --
   function to_inHg(pressure : press_p) return press_inHg is
   begin
      return press_inHg(float(pressure) / 3386.39);
   end;
   --
   function to_Pascal(pressure : press_mb) return press_p is
   begin
      return press_p(float(pressure) * 100.0);
   end;
   --
   function to_Pascal(pressure : press_atm) return press_p is
   begin
      return press_p(float(pressure) * 101325.0);
   end;
   --
   function to_Pascal(pressure : press_inHg) return press_p is
   begin
      return press_p(float(pressure) * 3386.39);
   end;
   -- -------------------------------------------------------------------------
   -- *** Velocity conversions ***
   --
   function to_mph(vel : vel_m_s) return vel_mph is
   begin
      return vel_mph(float(vel) * 2.2369_3629_11);
   end;
   --
   function to_km_h(vel : vel_m_s) return vel_km_h is
   begin
      return vel_km_h(float(vel) * 3.6);
   end;
   --
   function to_knots(vel : vel_m_s) return vel_knots is
   begin
      return vel_knots(float(vel) * 1.9438_4449_24);
   end;
   --
   function to_m_s(vel : vel_knots) return vel_m_s is
   begin
      return vel_m_s(float(vel) / 1.9438_4449_24);
   end;
   --
   function to_m_s(vel : vel_km_h) return vel_m_s is
   begin
      return vel_m_s(float(vel) / 3.6);
   end;
   --
   function to_m_s(vel : vel_mph) return vel_m_s is
   begin
      return vel_m_s(float(vel) / 2.2369_3629_11);
   end;
   --
   -- Velocity functions
   --
   function "*"(Left : vel_m_s; Right : Duration) return len_m is
   begin
      return len_m(Float(Left) * Float(Right));
   end;
   --
   function "*"(Left : Duration; Right : vel_m_s) return len_m is
   begin
      return len_m(Float(Left) * Float(Right));
   end;
   --
   function "/"(Left : vel_m_s; Right : Duration) return accel_m_s2 is
   begin
      return accel_m_s2(Float(Left) / Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Acceleration conversions ***
   --
   function to_m_s2(accel : accel_g) return accel_m_s2 is
   begin
      return accel_m_s2(Float(accel) * 9.80665);
   end;
   --
   function to_g(accel : accel_m_s2) return accel_g is
   begin
      return accel_g(Float(accel) / 9.80665);
   end;
   --
   -- Acceleration functions
   --
   function "*"(Left : accel_m_s2; Right : Duration) return vel_m_s is
   begin
      return vel_m_s(Float(Left) * Float(Right));
   end;
   --
   function "*"(Left : Duration; Right : accel_m_s2) return vel_m_s is
   begin
      return vel_m_s(Float(Left) * Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Angle conversions ***
   --
   function to_degrees(ang : ang_r) return ang_d is
   begin
      return ang_d(float(ang) * 180.0 / Ada.Numerics.Pi);
   end;
   --
   function to_radians(ang : ang_d) return ang_r is
   begin
      return ang_r(float(ang) * Ada.Numerics.Pi / 180.0);
   end;
   -- -------------------------------------------------------------------------
   -- *** Rotation rate conversions ***
   --
   function to_r_s(rot : rot_d_s) return rot_r_s is
   begin
      return rot_r_s(float(rot) * Ada.Numerics.Pi / 180.0);
   end;
   --
   function to_d_s(rot : rot_r_s) return rot_d_s is
   begin
      return rot_d_s(float(rot) * 180.0 / Ada.Numerics.Pi);
   end;
   --
   -- Rotation rate functions
   --
   function "*"(Left : rot_d_s; Right : Duration) return ang_d is
   begin
      return ang_d(Float(Left) * Float(Right));
   end;
   --
   function "*"(Left : Duration; Right : rot_d_s) return ang_d is
   begin
      return ang_d(Float(Left) * Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Functions for Ohms law ***
   --
   function "*"(Left : curr_a; Right : res_o) return emf_v is
   begin
      return emf_v(Float(Left) * Float(Right));
   end;
   --
   function "*"(Left : res_o; Right : curr_a) return emf_v is
   begin
      return emf_v(Float(Left) * Float(Right));
   end;
   --
   function "/"(Left : emf_v; Right : curr_a) return res_o is
   begin
      return res_o(Float(Left) / Float(Right));
   end;
   --
   function "/"(Left : emf_v; Right : res_o) return curr_a is
   begin
      return curr_a(Float(Left) / Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Frequency and time conversions ***
   --
   function to_hz(period : time_s) return freq_hz is
   begin
      return freq_hz(1.0/Float(period));
   end;
   --
   function to_minutes(period : time_s) return time_m is
   begin
      return time_m(period / 60.0);
   end;
   --
   function to_hours(period : time_s) return time_h is
   begin
      return time_h(period / 3600.0);
   end;
   --
   function to_seconds(freq : freq_hz) return time_s is
   begin
      return time_s(1.0/Float(freq));
   end;
   --
   function to_seconds(period : time_m) return time_s is
   begin
      return time_s(period * 60.0);
   end;
   --
   function to_seconds(period : time_h) return time_s is
   begin
      return time_s(period * 3600.0);
   end;
   --

end;
