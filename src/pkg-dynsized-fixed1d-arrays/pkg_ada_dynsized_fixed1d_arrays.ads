-- File: pkg_ada_dynsized_fixed1d_arrays.ads
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
package pkg_ada_dynsized_fixed1d_arrays
-- ========================================================
    with SPARK_Mode => on
is
   -- RENAMING STANDARD PACKAGES
   package AART renames Ada.Real_Time;
   package AASU renames Ada.Strings.Unbounded;
   
   -- RENAMING USER-CREATED PACKAGES

   -- LIST OF FUNCTIONS
   -- NOTE: All 1D array integer elements initialized to zero during creation
   
   type typ_array1d_int is array(Natural range <>) of Integer;
   function get_array1d_integer (dim1_min, dim1_max : Natural) return typ_array1d_int;  
   
   type typ_array1d_float is array(Natural range <>) of Float;
   function get_array1d_float (dim1_min, dim1_max : Natural) return typ_array1d_float;  
   
   
   type typ_array1d_char is array(Natural range <>) of Character;
   function get_array1d_character (dim1_min, dim1_max : Natural) return typ_array1d_char;  
   
   -- Try 2D array of fixed-size strings. Why not?
   
   
   -- LIST OF PROCEDURES
     
-- ======================================================== 
end pkg_ada_dynsized_fixed1d_arrays;
-- ========================================================
