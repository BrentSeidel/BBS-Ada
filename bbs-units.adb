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
package body BBS.units with SPARK_Mode => on is
   --
   -- Since the conversion and operation routines are so simple, most have been
   -- converted to expression functions.  Occasionally, one may be left here
   -- due to dependencies with partial type declarations.
   --
   -- Unit conversion routines.  Most of these are pretty simple.  Add as needed.
   -- The conversion factors come from a variety of sources and definitions.
   --
   -- -------------------------------------------------------------------------
   -- *** Distance conversions ***
   --
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
   -- -------------------------------------------------------------------------
   -- *** Volume conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Mass conversions ***
   --
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
   --
   function "/"(Left : force_n; Right : accel_m_s2) return mass_kg is
   begin
        return mass_kg(Float(Left) / Float(Right));
   end;
   --
   function "/"(Left : force_n; Right : mass_kg) return accel_m_s2 is
   begin
        return accel_m_s2(Float(Left) / Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Temperature conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Pressure conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Velocity conversions ***
   --
   --
   -- Velocity functions
   --
   function "/"(Left : vel_m_s; Right : Duration) return accel_m_s2 is
   begin
      return accel_m_s2(Float(Left) / Float(Right));
   end;
   -- -------------------------------------------------------------------------
   -- *** Acceleration conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Angle conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Rotation rate conversions ***
   --
   -- -------------------------------------------------------------------------
   -- *** Functions for Ohms law ***
   --
   -- -------------------------------------------------------------------------
   -- *** Frequency and time conversions ***
   --

end;
