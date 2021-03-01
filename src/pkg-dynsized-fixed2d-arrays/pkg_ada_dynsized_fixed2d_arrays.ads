-- File: pkg_ada_dynsized_fixed2d_arrays.ads
-- Date: Mon 01 Mar 2021 11:04:46 AM +08
-- Author: WRY
-- Version: 1.0 Mon 01 Mar 2021 11:04:46 AM +08
-- ========================================================
-- LIST OF STANDARD ADA PACKAGES
with Ada.Real_Time;         
use  Ada.Real_Time;
with Ada.Strings.Unbounded; 
use  Ada.Strings.Unbounded;

-- LIST OF USER-CREATED PACKAGES

-- ========================================================
package pkg_ada_dynsized_fixed2d_arrays
-- ========================================================
    with SPARK_Mode => on
is
   -- RENAMING STANDARD PACKAGES
   package AART renames Ada.Real_Time;
   package AASU renames Ada.Strings.Unbounded;
   
   -- RENAMING USER-CREATED PACKAGES

   -- LIST OF FUNCTIONS
   -- NOTE: All 2D array integer elements initialized to zero during creation
   type typ_array2d is array(Natural range <>, Natural range <>) of Integer;
   function get_array2d_integer (dim1_min, dim1_max : Natural; 
                                 dim2_min, dim2_max : Natural)                            
                                 return typ_array2d;  
   
   
   
   -- LIST OF PROCEDURES
   procedure create_2d_integer_array;
   procedure create_2d_float_array;
   procedure create_2d_string_array;
   procedure create_2d_character_array;
   
-- ======================================================== 
end pkg_ada_dynsized_fixed2d_arrays;
-- ========================================================
