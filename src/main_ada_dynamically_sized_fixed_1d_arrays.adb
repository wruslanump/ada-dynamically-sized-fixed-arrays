-- File: main_ada_dynamically_sized_fixed_1d_arrays.adb
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
with pkg_ada_dynsized_fixed1d_arrays;
with pkg_ada_dynsized_fixed2d_arrays;
-- with pkg_ada_dynsized_fixed3d_arrays;

-- ========================================================
procedure main_ada_dynamically_sized_fixed_1d_arrays
-- ========================================================
	with SPARK_Mode => on
is 

   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO      renames Ada.Text_IO;
   package AIntTIO   renames Ada.Integer_Text_IO;
   package AFltTIO   renames Ada.Float_Text_IO;
   package ART       renames Ada.Real_Time;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_date_time_stamp;
   package PARN    renames pkg_ada_random_numbers;
   package PADF1D  renames pkg_ada_dynsized_fixed1d_arrays;
   -- package PADF2D renames pkg_ada_dynsized_fixed2d_arrays;
   -- package PADF3D renames pkg_ada_dynsized_fixed3d_arrays;
   
   -- VARIABLES AND CONSTANTS IN MAIN
   ret_integer : Integer := 999;
   ret_float   : Float   := 999.999;
   
   dim1min : Natural := 1; dim1max : Natural := 7;
   
   
   -- All 2D array elements initialized to zero during creation
   -- in function implementation (body of PADF2D package)
   -- Create a 2D array
   Array1D_Integer_01 : PADF1D.typ_array1d_int   := PADF1D.get_array1d_integer   (dim1min, dim1max);
   Array1D_Float_01   : PADF1D.typ_array1d_float := PADF1D.get_array1d_float     (dim1min, dim1max);
   Array1D_Char_01    : PADF1D.typ_array1d_char  := PADF1D.get_array1d_character (dim1min, dim1max);
   
begin  -- for procedure main
   
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.Put_Line ("MAIN PROGRAM STARTED SUCCESSFULLY."); ATIO.New_Line;
   
   -- TESTING: This removes the need of 'Image for various variables
   
         -- ATIO.Put ("TESTING: Decimal(126) = ");
         -- ATIO.Put (" Binary(126) = ");
         -- AIntTIO.Put(126, Width => 13, Base => 2);  -- Min for base
         
         -- ATIO.Put (" Octal(126) = ");
         -- AIntTIO.Put(126, Width => 13, Base => 8);
         
         -- ATIO.Put (" Decimal(126) = ");
         -- AIntTIO.Put(126, Width => 13, Base => 10);
         
         -- ATIO.Put (" Hex(126) = ");
         -- AIntTIO.Put(126, Width => 13, Base => 16); -- Max for Base
         -- ATIO.New_Line;
      
   -- Test (1) Array1D_Integer_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(1) TESTING Array1D_Integer_01 (1..7) assignments of random integer (-10, +10).");
   
   -- REF: http://www.ada-auth.org/standards/12rm/html/RM-A-10-8.html
   -- For AIntTIO, the NORMAL DEFAULT: 
   -- For Intrger, Width = 8, Base = 10
   -- Below, we set Integer width to what we want, then
   -- after the loop we reset back
   
   -- THE FORMAT SPECIFICATION WITHOUT USING 'Image
   -- AIntTIO.Put (Item => (value int_variable), 
   --              Width => (width of int_variable), 
   --              Base => (base of int_variable );
   
   -- SET DEFAULTS BEFORE LOOP
   AIntTIO.Default_Width := 3;  -- Integer width
   AIntTIO.Default_Base  := 10; -- Decimal
   
   -- Execute the loop
   for I in dim1min .. dim1max loop
             
         -- Execute get random integer
         Array1D_Integer_01 (I) := PARN.get_random_integer (-10, +10);
         
         -- NOT USING Integer'Image()
         -- The original using 'Image REPLACED BELOW
         
         -- THIS WORKS USING ATIO
         -- ATIO.Put_Line ("Array1D_Integer_01 (" & 
         --               Integer'Image (I) & " ) = " &       
         --               Integer'Image(Array1D_Integer_01 (I))); 
         
         -- THE REPLACEMENT USING AIntTIO ALSO WORKS
         ATIO.Put ("Array1D_Integer_01 ("); 
         AIntTIO.Put(Item => I);                  -- Using AIntTIO not ATIO
         ATIO.Put(") = ");
         AIntTIO.Put(Array1D_Integer_01 (I));     -- Using AIntTIO not ATIO
         ATIO.New_Line;
   
   end loop; -- END loop I   
   
   -- IMPT: RESET Integer width to NORMAL DEFAULT VALUES (AIntTIO not ATIO)_
   AIntTIO.Default_Width := 8;  
   AIntTIO.Default_Base  := 10; -- Decimal
   
   ATIO.New_Line;
 
   -- Test (2) Array1D_Integer_02 
   ATIO.Put_Line ("========================================================");
   
   -- Assume variables changes for dim1min, dim1max
   ATIO.Put_Line ("(2) TESTING Array1D_Integer_02 (dim1min, dim1max) assignments.");
   ATIO.Put_Line ("Values of (dim1min, dim1max) are DYNAMIC. Ha ha ha");
   -- NOTE: Outside of declare, change array range variables (WORKING GOOD) 
   -- This makes dynamically sized fixed arrays. Ha ha ha. 
   
   -- SET values of (dim1min, dim1max) programmatically (dynamic)
   dim1min := 1; dim1max := 12;
      
   declare   
      -- Create a new 1D array
      -- Initialized to zero during creation
      Array1D_Integer_02 : PADF1D.typ_array1d_int := PADF1D.get_array1d_integer (dim1min, dim1max);
   
   begin -- for declare section INTEGER
          
      -- Index for 1 array is (row)
      ATIO.Put_Line ("Array1D_Integer_02 (1) = " & Integer'Image (Array1D_Integer_02 (1))); 
      ATIO.Put_Line ("Array1D_Integer_02 (3) = " & Integer'Image (Array1D_Integer_02 (3))); 
          
      -- Assign values to array elements
      Array1D_Integer_02 (1) := 2055;
      ATIO.Put_Line ("Array1D_Integer_02 (1) = " & Integer'Image (Array1D_Integer_02 (1))); 
      
      Array1D_Integer_02 (3) := PARN.get_random_integer(100, 200);
      ATIO.Put_Line ("Array1D_Integer_02 (3) = " & Integer'Image (Array1D_Integer_02 (3))); 
      ATIO.New_Line;
              
      for I in dim1min .. dim1max loop
               
         ATIO.Put_Line ("Array1D_Integer_02 (" & 
                        Integer'Image (I) & ")" & 
                        Integer'Image(Array1D_Integer_02 (I))); 
                 
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section   
   
   -- Test (3) Array1D_Float_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(3) TESTING Array1D_Float_01 (1..6) assignments of random float (-100.0, +100.0)");
   
   -- RESET package-wise variables because was changed in Test (2)
   -- DYNAMIC ASSIGNMENT
      dim1min := 1; dim1max := 6;
      
      -- SET DECIMAL WIDTH BEFORE LOOP
      AIntTIO.Default_Width := 3;  -- Integer width
      AIntTIO.Default_Base  := 10; -- Decimal
   
   -- FOR FLOATS
   -- REF: https://www.adaic.org/resources/add_content/standards/05rm/html/RM-A-10-9.html
   -- EXAMPLE: AFltTIO.Put(X, Fore => 5, Aft => 3, Exp => 2);   
   
   -- USING FLOAT FORMAT 
         -- Format based on distance referred to decimal point
         -- Fore = before decimal point
         -- Aft  = after decimal point
         -- Exp  = width of exponent (including + and - sign)
         
   -- Default_Fore : Field := 2;
   -- Default_Aft  : Field := Num'Digits-1;
   -- Default_Exp  : Field := 3;
   
      -- EXECUTE LOOP
      for I in dim1min .. dim1max loop
          
          -- Assign random float number number to 1D-array
          Array1D_Float_01 (I) := PARN.get_random_float (-100.0, +100.0);
           
         -- FLOAT FORMATTING SPECIFICATIONS 
         -- Format based on distance to referred to decimal point
         -- Fore = before decimal point
         -- Aft  = after decimal point
         -- Exp  = width of exponent (including + and - sign)
      
      
         ATIO.Put ("Array1D_Float_01 (" );
      -- Using AIntTIO for Integer
         AIntTIO.Put(Item => I);              
         ATIO.Put(") = ");
      -- Using AFltTIO for Float
         AFltTIO.Put(Item => Array1D_Float_01 (I), Fore => 3, Aft => 10, Exp => 4);  
         ATIO.New_Line;
       
   end loop; -- END loop I 
   
   -- RESET AFTER LOOP
   AIntTIO.Default_Width := 8;  -- Integer width
   AIntTIO.Default_Base  := 10; -- Decimal
   ATIO.New_Line;
   
    -- Test (4) Array1D_Float_02 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(4) TESTING Array1D_Float_02 (3..10) assignments.");   
  
   -- DYNAMIC ASSIGNMENT FOR ARRAY INDEX (ARRAY SIZE)
   dim1min := 3; dim1max := 10;  -- Array size is 7 elements
      
   declare  -- start section declare for FLOAT
      
      -- Create a new 1D array. Initialized to zero during creation
      Array1D_Float_02 : PADF1D.typ_array1d_float := PADF1D.get_array1d_float (dim1min, dim1max);
   
   begin    -- declare section begin for FLOAT
          
     -- ARRAY INDEX MUST BE BETWEEN dim1min := 3; dim1max := 10;
      ATIO.Put_Line ("Array1D_Float_02 (5) = " & Float'Image (Array1D_Float_02 (5))); 
      ATIO.Put_Line ("Array1D_Float_02 (8) = " & Float'Image (Array1D_Float_02 (8))); 
      
      -- Assign values to array elements
      Array1D_Float_02 (4) := 12.756;
      ATIO.Put_Line ("Array1D_Float_02 (9) = " & Float'Image (Array1D_Float_02 (9))); 
      
      Array1D_Float_02 (7) := PARN.get_random_float (22.25, 32.25);
      ATIO.Put_Line ("Array1D_Float_02 (7) = " & Float'Image (Array1D_Float_02 (7))); 
      ATIO.New_Line;
      
      for I in dim1min .. dim1max loop
             
         ATIO.Put_Line ("Array1D_Float_02 (" & 
                        Integer'Image (I) & ") = " & 
                        Float'Image(Array1D_Float_02 (I))); 
         
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section for FLOAT     
   
   -- Test (5) Array2D_Char_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(5) TESTING Array2D_Char_01 (1..4) assignments.");
   
      -- RESET package-wise variables because was changed in Test (2)
      dim1min := 1; dim1max := 4; 
      
      for I in dim1min .. dim1max loop
          -- for J in dim2min .. dim2max loop 
          
         if (I rem 2 = 0) then
             Array1D_Char_01 (I) := 'E'; -- Even number assign char E
         elsif (I rem 2 = 1) then
             Array1D_Char_01 (I) := 'O'; -- Odd number assign char O
         else
             ATIO.Put_line ("PROBLEMO WITH Even/Odd integers");
         end if;    
            
         ATIO.Put_Line ("Array1D_Char_01 (" & 
                        Integer'Image (I) & ") = " & 
                        Character'Image(Array1D_Char_01 (I))); 
         
          -- end loop; -- END loop J
      end loop; -- END loop I   
   ATIO.New_Line;
   
   -- Test (6) Array2D_Char_02 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(6) TESTING Array2D_Char_02 (1..6) assignments.");
      
        dim1min := 1; dim1max := 6; 
      
   declare  -- START declare section for CHAR
      
      -- Create a new 1D array of characters
      -- Initialize to ' ' whitespace during creation
      Array1D_Char_02 : PADF1D.typ_array1d_char := PADF1D.get_array1d_character (dim1min, dim1max);
   
   begin    --  declare section for CHAR
     
      ATIO.Put_Line ("Array1D_Char_02 (2) = " & Character'Image (Array1D_Char_02 (2))); 
      ATIO.Put_Line ("Array1D_Char_02 (5) = " & Character'Image (Array1D_Char_02 (5))); 
      
      -- Assign values to array elements
      Array1D_Char_02 (2) := 'W';
      ATIO.Put_Line ("Array1D_Char_02 (2) = " & Character'Image (Array1D_Char_02 (2))); 
      
      Array1D_Char_02 (3) := 'R';
      ATIO.Put_Line ("Array1D_Char_02 (3) = " & Character'Image (Array1D_Char_02 (3))); 
      ATIO.New_Line;
      
      for I in dim1min .. dim1max loop
      
         ATIO.Put_Line ("Array1D_Char_02 (" & 
                        Integer'Image (I) & ") = " & 
                        Character'Image(Array1D_Char_02 (I))); 
      
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section for CHAR        
   -- =====================================================       
      
   ATIO.New_Line; ATIO.Put_Line ("MAIN PROGRAM TERMINATED SUCCESSFULLY.");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
   
-- ========================================================   
end main_ada_dynamically_sized_fixed_1d_arrays;
-- ========================================================
