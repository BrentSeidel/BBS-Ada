package body BBS.units is
   --
   -- Unit conversion routines.  Most of these are pretty simple.  Add as needed.
   -- The conversion factors come from a variety of sources and definitions.
   --
   -- *** Distance conversions ***
   --
   function to_feet(dist : len_m) return len_ft is
   begin
      return len_ft(float(dist) * 3.28084);
   end;
   --
   function to_meters(dist : len_ft) return len_m is
   begin
      return len_m(float(dist) / 3.28084);
   end;
   --
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
   --
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
   --
   -- *** Velocity conversions ***
   --
   function to_mph(vel : vel_m_s) return vel_mph is
   begin
      return vel_mph(float(vel) * 2.2369_3629_11);
   end;
   --
   function to_km_h(vel : vel_m_s) return vel_km_h is
   begin
      return vel_km_h(float(vel) * 3600.0/1000.0);
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
   function to_m_s(vel : vel_km_h) return vel_m_s is
   begin
      return vel_m_s(float(vel) * 1000.0/3600.0);
   end;
   --
   function to_m_s(vel : vel_mph) return vel_m_s is
   begin
      return vel_m_s(float(vel) / 2.2369_3629_11);
   end;

end;
