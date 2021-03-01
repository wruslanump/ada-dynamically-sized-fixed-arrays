-- File: main_ada_dynamically_sized_fixed_arrays.adb
-- Date: Mon 01 Mar 2021 11:04:46 AM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================
-- 
-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_date_time_stamp;
with pkg_ada_random_numbers;
-- with pkg_ada_dynsized_fixed1d_arrays;
with pkg_ada_dynsized_fixed2d_arrays;
-- with pkg_ada_dynsized_fixed3d_arrays;

-- ========================================================
procedure main_ada_dynamically_sized_fixed_arrays
-- ========================================================
	with SPARK_Mode => on
is 

   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package AITIO   renames Ada.Integer_Text_IO;
   package AFTIO   renames Ada.Float_Text_IO;
   package ART     renames Ada.Real_Time;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_date_time_stamp;
   package PARN    renames pkg_ada_random_numbers;
   -- package PADF1D renames pkg_ada_dynsized_fixed1d_arrays;
   package PADF2D renames pkg_ada_dynsized_fixed2d_arrays;
   -- package PADF3D renames pkg_ada_dynsized_fixed3d_arrays;
   
   -- VARIABLES AND CONSTANTS IN MAIN
   ret_integer : Integer := 999;
   ret_float   : Float   := 999.999;
   
   dim1min : Natural := 1; dim1max : Natural := 4;
   dim2min : Natural := 3; dim2max : Natural := 7;
   
   -- All 2D array elements initialized to zero during creation
   -- in function implementation (body of PADF2D package)
   -- Create a 2D array
   Array2D_Integer_01 : PADF2D.typ_array2d_int   := PADF2D.get_array2d_integer   (dim1min, dim1max, dim2min, dim2max);
   Array2D_Float_01   : PADF2D.typ_array2d_float := PADF2D.get_array2d_float     (dim1min, dim1max, dim2min, dim2max);
   Array2D_Char_01    : PADF2D.typ_array2d_char  := PADF2D.get_array2d_character (dim1min, dim1max, dim2min, dim2max);
   
begin  -- for procedure main
   
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.Put_Line ("MAIN PROGRAM STARTED SUCCESSFULLY."); ATIO.New_Line;
   
   -- Test (1) Array2D_Integer_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(1) TESTING Array2D_Integer_01 (1..4, 3..7) assignments.");
   for I in dim1min .. dim1max loop
      for J in dim2min .. dim2max loop 
         
         Array2D_Integer_01 (I, J) := PARN.get_random_integer (-10, +10);
         ATIO.Put_Line ("Array2D_Integer_01 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Integer'Image(Array2D_Integer_01 (I,J))); 
         
      end loop; -- END loop J
   end loop; -- END loop I   
   ATIO.New_Line;
   
   -- Test (2) Array2D_Integer_02 
   ATIO.Put_Line ("========================================================");
   -- Assume variables changes for dim1min, dim1max, dim2min, dim2max
   ATIO.Put_Line ("(2) TESTING Array2D_Integer_02 (dim1min, dim1max, dim2min, dim2max)) assignments.");
   
   -- NOTE: Outside of declare, change array range variables (WORKING GOOD) 
   -- This makes dynamically sized fixed arrays. Ha ha ha. 
   dim1min := 1; dim1max := 6; dim2min := 1; dim2max := 4;
      
   declare   
      -- Create a new 2D array
      -- Initialized to zero during creation
      Array2D_Integer_02 : PADF2D.typ_array2d_int := PADF2D.get_array2d_integer (dim1min, dim1max, dim2min, dim2max);
   
   begin -- for declare section INTEGER
          
      -- Index for 2D array is (row, col)
      ATIO.Put_Line ("Array2D_Integer_02 (2, 3) = " & Integer'Image (Array2D_Integer_02 (2, 3))); 
      ATIO.Put_Line ("Array2D_Integer_02 (5, 4) = " & Integer'Image (Array2D_Integer_02 (5, 4))); 
      
      -- ATIO.Put_Line ("TESTING REMOVE Integer'Image()");
      -- AITIO.Put (Array2D_Integer_02 (2, 3), Array2D_Integer_02 (5, 4) );
      -- ATIO.New_Line;
      
      -- Assign values to array elements
      Array2D_Integer_02 (2, 2) := 2055;
      ATIO.Put_Line ("Array2D_Integer_02 (2, 2) = " & Integer'Image (Array2D_Integer_02 (2, 2))); 
      
      Array2D_Integer_02 (3, 4) := PARN.get_random_integer(100, 200);
      ATIO.Put_Line ("Array2D_Integer_02 (3, 4) = " & Integer'Image (Array2D_Integer_02 (3, 4))); 
      ATIO.New_Line;
      
      -- ATIO.Put_Line ("TESTING REMOVE Integer'Image()");
      -- AITIO.Put (Array2D_Integer_02 (2, 2), Array2D_Integer_02 (3, 4) );
      
      for I in dim1min .. dim1max loop
         for J in dim2min .. dim2max loop 
          
         ATIO.Put_Line ("Array2D_Integer_02 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Integer'Image(Array2D_Integer_02 (I,J))); 
         
         end loop; -- END loop J
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section INTEGER  
   
   -- Test (3) Array2D_Float_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(3) TESTING Array2D_Float_01 (1..4, 3..7) assignments.");
   
      -- RESET package-wise variables because was changed in Test (2)
      dim1min := 1; dim1max := 4; dim2min := 3; dim2max := 7;
      
      for I in dim1min .. dim1max loop
          for J in dim2min .. dim2max loop 
         
         Array2D_Float_01 (I, J) := PARN.get_random_float (-10.0, +10.0);
         ATIO.Put_Line ("Array2D_Float_01 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Float'Image(Array2D_Float_01 (I,J))); 
         
          end loop; -- END loop J
      end loop; -- END loop I   
   ATIO.New_Line;
   
    -- Test (4) Array2D_Float_02 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(4) TESTING Array2D_Float_02 (1..6, 1..4) assignments.");   
  
   dim1min := 1; dim1max := 6; dim2min := 1; dim2max := 4;
      
   declare
      -- Create a new 2D array
      -- Initialized to zero during creation
      Array2D_Float_02 : PADF2D.typ_array2d_float := PADF2D.get_array2d_float (dim1min, dim1max, dim2min, dim2max);
   
   begin -- for declare section FLOAT
          
      -- Index for 2D array is (row, col)
      ATIO.Put_Line ("Array2D_Float_02 (2, 3) = " & Float'Image (Array2D_Float_02 (2, 3))); 
      ATIO.Put_Line ("Array2D_Float_02 (5, 4) = " & Float'Image (Array2D_Float_02 (5, 4))); 
      
      -- Assign values to array elements
      Array2D_Float_02 (2, 2) := 12.756;
      ATIO.Put_Line ("Array2D_Float_02 (2, 2) = " & Float'Image (Array2D_Float_02 (2, 2))); 
      
      Array2D_Float_02 (3, 4) := PARN.get_random_float (22.25, 32.25);
      ATIO.Put_Line ("Array2D_Float_02 (3, 4) = " & Float'Image (Array2D_Float_02 (3, 4))); 
      ATIO.New_Line;
      
      for I in dim1min .. dim1max loop
         for J in dim2min .. dim2max loop 
          
         ATIO.Put_Line ("Array2D_Float_02 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Float'Image(Array2D_Float_02 (I,J))); 
         
         end loop; -- END loop J
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section FLOAT     
   
   -- Test (5) Array2D_Char_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(5) TESTING Array2D_Char_01 (1..4, 3..7) assignments.");
   
      -- RESET package-wise variables because was changed in Test (2)
      dim1min := 1; dim1max := 4; dim2min := 3; dim2max := 7;
      
      for I in dim1min .. dim1max loop
          for J in dim2min .. dim2max loop 
          
         if (I rem 2 = 0) then
             Array2D_Char_01 (I, J) := 'E'; -- Even number assign char E
         elsif (I rem 2 = 1) then
             Array2D_Char_01 (I, J) := 'O'; -- Odd number assign char O
         else
             ATIO.Put_line ("PROBLEMO WITH Even/Odd integers");
         end if;    
            
         ATIO.Put_Line ("Array2D_Char_01 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Character'Image(Array2D_Char_01 (I,J))); 
         
          end loop; -- END loop J
      end loop; -- END loop I   
   ATIO.New_Line;
   
   -- Test (6) Array2D_Char_02 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(6) TESTING Array2D_Char_02 (1..6, 3..4) assignments.");
      
        dim1min := 1; dim1max := 6; dim2min := 1; dim2max := 4;
      
   declare
      -- Create a new 2D array
      -- Initialized to ' ' whitespace during creation
      Array2D_Char_02 : PADF2D.typ_array2d_char := PADF2D.get_array2d_character (dim1min, dim1max, dim2min, dim2max);
   
   begin -- for declare section CHAR
          
      -- Index for 2D array is (row, col)
      ATIO.Put_Line ("Array2D_Char_02 (2, 3) = " & Character'Image (Array2D_Char_02 (2, 3))); 
      ATIO.Put_Line ("Array2D_Char_02 (5, 4) = " & Character'Image (Array2D_Char_02 (5, 4))); 
      
      -- Assign values to array elements
      Array2D_Char_02 (2, 2) := 'W';
      ATIO.Put_Line ("Array2D_Char_02 (2, 2) = " & Character'Image (Array2D_Char_02 (2, 2))); 
      
      Array2D_Char_02 (3, 4) := 'R';
      ATIO.Put_Line ("Array2D_Char_02 (3, 4) = " & Character'Image (Array2D_Char_02 (3, 4))); 
      ATIO.New_Line;
      
      for I in dim1min .. dim1max loop
         for J in dim2min .. dim2max loop 
          
         ATIO.Put_Line ("Array2D_Char_02 (" & 
                        Integer'Image (I) & "," & 
                        Integer'Image (J) & ") = " &
                        Character'Image(Array2D_Char_02 (I,J))); 
         
         end loop; -- END loop J
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section CHAR        
   -- =====================================================       
      
   ATIO.New_Line; ATIO.Put_Line ("MAIN PROGRAM TERMINATED SUCCESSFULLY.");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
   
-- ========================================================   
end main_ada_dynamically_sized_fixed_arrays;
-- ========================================================
