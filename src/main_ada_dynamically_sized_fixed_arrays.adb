-- File: main_ada_dynamically_sized_fixed_arrays.adb
-- Date: Mon 01 Mar 2021 11:04:46 AM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================
-- 
-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_date_time_stamp;
with pkg_ada_random_numbers;

-- ========================================================
procedure main_ada_dynamically_sized_fixed_arrays
-- ========================================================
	with SPARK_Mode => on
is 

   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package ART     renames Ada.Real_Time;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_date_time_stamp;
   package PARN    renames pkg_ada_random_numbers;
   
   -- VARIABLES AND CONSTANTS IN MAIN
   ret_integer : Integer := 999;
   ret_float   : Float   := 999.999;
   
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");

   -- TESTING PACKAGE PARN (WORKING GOOD)
   -- PARN.generate_10_random_integers;
   -- PARN.generate_10_random_floats;
   -- ret_integer := PARN.get_random_integer (-10, +10);
   -- ret_float   := PARN.get_random_float (-15.333, +15.555);
   -- ATIO.Put_Line ("ret_integer = " & Integer'Image(ret_Integer));
   -- ATIO.Put_Line ("ret_float   = " & Float'Image(ret_float));
   
                  
         
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
   
-- ========================================================   
end main_ada_dynamically_sized_fixed_arrays;
-- ========================================================
