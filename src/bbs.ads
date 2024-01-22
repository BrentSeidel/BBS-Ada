--
-- Author: Brent Seidel
-- Version: V01.01
-- Date: 27-Apr-2021
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
with Ada.Unchecked_Conversion;
package BBS with SPARK_Mode => on is
   pragma Pure;
   pragma No_Elaboration_Code_All;
   --
   -- This is really trivial so I don't care if anyone copies this.  If you do
   -- though, you should at least change it to your name and initials.
   --
   --  Since many of my packeges are for embedded or related software,
   --  some basic types and conversions are defined here so that they
   --  can easily be used everywhere else.
   --
   type bit is range 0 .. 1
     with Size => 1;
   type int8 is range -128 .. 127
     with size => 8;
   type uint8 is mod 2**8
     with size => 8;
   type int16 is range -(2**15) .. 2**15 - 1
     with size => 16;
   type uint16 is mod 2**16
     with Size => 16;
   type int32 is range -(2**31) .. 2**31 - 1
     with Size => 32;
   type uint32 is mod 2**32
     with Size => 32;
   type int64 is range -(2**63) .. 2**63 - 1
     with Size => 64;
   type uint64 is mod 2**64
     with Size => 64;
   --
   -- Some unchecked conversions to convert between unsigned and signed values.
   --
   function uint8_to_int8 is
     new Ada.Unchecked_Conversion(source => uint8, target => int8);
   function int8_to_uint8 is
     new Ada.Unchecked_Conversion(source => int8, target => uint8);
   function uint16_to_int16 is
     new Ada.Unchecked_Conversion(source => uint16, target => int16);
   function int16_to_uint16 is
     new Ada.Unchecked_Conversion(source => int16, target => uint16);
   function uint32_to_int is
      new Ada.Unchecked_Conversion(source => uint32, target => Integer);
   function int_to_uint32 is
      new Ada.Unchecked_Conversion(source => Integer, target => uint32);
   function uint64_to_int64 is
     new Ada.Unchecked_Conversion(source => uint64, target => int64);
   function int64_to_uint64 is
     new Ada.Unchecked_Conversion(source => int64, target => uint64);
end BBS;
