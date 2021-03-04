-- File: main_ada_dynamically_sized_fixed_3d_arrays.adb
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
-- with pkg_ada_dynsized_fixed2d_arrays;
with pkg_ada_dynsized_fixed3d_arrays;

-- ========================================================
procedure main_ada_dynamically_sized_fixed_3d_arrays
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
   -- package PADF1D renames pkg_ada_dynsized_fixed1d_arrays;
   -- package PADF2D renames pkg_ada_dynsized_fixed2d_arrays;
   package PADF3D renames pkg_ada_dynsized_fixed3d_arrays;
   
   -- VARIABLES AND CONSTANTS IN MAIN
   ret_integer : Integer := 999;
   ret_float   : Float   := 999.999;
   
   -- WE CHANGE THESE DYNAMICALLY PACKAGE-WISE
   -- BUT MUST BE WITHIN DEFINED RANGE
   dim1_min : Natural := 1; dim1_max : Natural := 10;
   dim2_min : Natural := 1; dim2_max : Natural := 10;
   dim3_min : Natural := 1; dim3_max : Natural := 10; 
   
   
   -- All 3D array elements initialized to zero during creation
   -- in function implementation (body of PADF3D package)
   
   -- Create a 3D integer array
   Array3D_Integer_01 : PADF3D.typ_array3d_int   := PADF3D.get_array3d_integer   
     (dim1_min, dim1_max, 
      dim2_min, dim2_max, 
      dim3_min, dim3_max);
   
   -- Create a 3D float array
   Array3D_Float_01   : PADF3D.typ_array3d_float := PADF3D.get_array3d_float     
     (dim1_min, dim1_max, 
      dim2_min, dim2_max, 
      dim3_min, dim3_max);
   
   
begin  -- for procedure main
   
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   ATIO.Put_Line ("MAIN PROGRAM STARTED SUCCESSFULLY."); ATIO.New_Line;
   
   -- ***** TO CONTINUE HERE 
   
   -- Test (1) Array3D_Integer_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(1) TESTING Array3D_Integer_01 (1..4, 3..7, 6..8)) assignments.");
   
   -- REF: http://www.ada-auth.org/standards/12rm/html/RM-A-10-8.html
   -- For AIntTIO, the NORMAL DEFAULT: 
   -- For Intrger, Width = 8, Base = 10
   -- Below, we set Integer width to what we want, then
   -- after the loop we reset back
   
   -- THE FORMAT SPECIFICATION WITHOUT USING 'Image
   -- AIntTIO.Put (Item => (value int_variable), 
   --              Width => (width of int_variable), 
   --              Base => (base of int_variable );
   
   -- CHANGE 3DARRAY DIMENSIONS
   dim1_min := 1; dim1_max := 4; 
   dim2_min := 3; dim2_max := 7; 
   dim3_min := 6; dim3_max := 8;
   
   
   -- SET DEFAULTS BEFORE LOOP
   AIntTIO.Default_Width := 3;  -- Integer width
   AIntTIO.Default_Base  := 10; -- Decimal
   
   -- Execute the loop
   for I in dim1_min .. dim1_max loop
      for J in dim2_min .. dim2_max loop 
         for K in dim3_min .. dim3_max loop 
            
         -- Execute get random integer
         Array3D_Integer_01 (I, J, K) := PARN.get_random_integer (-10, +10);
         
     
         -- THE REPLACEMENT
         ATIO.Put ("Array3D_Integer_01 ("); 
         AIntTIO.Put(Item => I); 
         ATIO.Put(",");
         AIntTIO.Put(Item => J); 
            ATIO.Put(",");   
         AIntTIO.Put(Item => K);     
         ATIO.Put(") = ");
            AIntTIO.Put(Array3D_Integer_01 (I,J,K));
            
         ATIO.New_Line;
       end loop; -- END loop K               
      end loop; -- END loop J
   end loop; -- END loop I   
   
   -- IMPT: RESET Integer width to NORMAL DEFAULT VALUES
   AIntTIO.Default_Width := 8;  
   AIntTIO.Default_Base  := 10; -- Decimal
   
   ATIO.New_Line;
   
   
   -- Test (2) Array3D_Float_01 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(2) TESTING Array3D_Float_01 (2..5, 4..6, 7..8) assignments.");
   
      -- RESET package-wise variables because was changed in Test (2)
   dim1_min := 2; dim1_max := 5; 
   dim2_min := 4; dim2_max := 6; 
   dim3_min := 7; dim3_max := 8;
      
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
      for I in dim1_min .. dim1_max loop
          for J in dim2_min .. dim2_max loop 
            for K in dim3_min .. dim3_max loop 
            
         -- Assign a random float to each element of 3D array   
         Array3D_Float_01 (I, J, K) := PARN.get_random_float (-10.0, +10.0);
            
         -- WORKING BUT USING 'Image
         -- ATIO.Put_Line ("Array2D_Float_01 (" & 
         --               Integer'Image (I) & "," & 
         --               Integer'Image (J) & ") = " &
         --               Float'Image(Array2D_Float_01 (I,J))); 
         
         -- DISPLAY LINES WITHOUT USING 'Image AS ABOVE
         ATIO.Put ("Array3D_Float_01 (" );
         AIntTIO.Put(Item => I);  ATIO.Put(",");
         AIntTIO.Put(Item => J);  ATIO.Put(",");
         AIntTIO.Put(Item => K);  ATIO.Put(") = ");
         AFltTIO.Put(Item => Array3D_Float_01 (I,J,K),
                     Fore => 3, Aft => 10, Exp => 3);  
         ATIO.New_Line;
       
            end loop; -- END look K   
         end loop; -- END loop J
   end loop; -- END loop I 
   
   -- RESET AFTER LOOP
   AIntTIO.Default_Width := 8;  -- Integer width
   AIntTIO.Default_Base  := 10; -- Decimal
   ATIO.New_Line;
   
    -- Test (3) Array3D_Float_02 
   ATIO.Put_Line ("========================================================");
   ATIO.Put_Line ("(3) TESTING Array3D_Float_02 (1..6, 1..4, 1..3) assignments.");   
  
   -- ASSIGN THE SIZE DYNAMICALLY (CHANGING IT)
   dim1_min := 1; dim1_max := 6; 
   dim2_min := 1; dim2_max := 4;
   dim3_min := 1; dim3_max := 3;  
   
   declare
      -- Create a new 3D array
      -- Initialized to zero during creation
      Array3D_Float_02 : PADF3D.typ_array3d_float := PADF3D.get_array3d_float (dim1_min, dim1_max,
                                                                               dim2_min, dim2_max, 
                                                                               dim3_min, dim3_max);
   begin -- for declare section FLOAT
          
       -- SET DEFAULTS BEFORE LOOP
      AIntTIO.Default_Width := 3;  -- Integer width
      AIntTIO.Default_Base  := 10; -- Decimal
      
      for I in dim1_min .. dim1_max loop
         for J in dim2_min .. dim2_max loop 
            for K in dim3_min .. dim3_max loop 
               
         Array3D_Float_01 (I, J, K) := PARN.get_random_float (-10.0, +10.0);  
            
         -- DISPLAY LINES WITHOUT USING 'Image AS ABOVE
         ATIO.Put ("Array3D_Float_01 (" );
         AIntTIO.Put(Item => I);  ATIO.Put(",");
         AIntTIO.Put(Item => J);  ATIO.Put(",");
         AIntTIO.Put(Item => K);  ATIO.Put(") = ");
         AFltTIO.Put(Item => Array3D_Float_01 (I,J,K),
                     Fore => 3, Aft => 10, Exp => 3);  
         ATIO.New_Line;
         
             end loop;  -- END loop K  
         end loop; -- END loop J
      end loop; -- END loop I   
      ATIO.New_Line;
      
   end; -- END declare section FLOAT     
   
    
   -- =====================================================       
      
   ATIO.New_Line; ATIO.Put_Line ("MAIN PROGRAM TERMINATED SUCCESSFULLY.");
   PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
   
-- ========================================================   
end main_ada_dynamically_sized_fixed_3d_arrays;
-- ========================================================
