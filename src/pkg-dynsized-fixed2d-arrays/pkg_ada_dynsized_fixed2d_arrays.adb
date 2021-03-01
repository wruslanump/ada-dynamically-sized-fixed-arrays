-- File: pkg_ada_dynsized_fized2d_arrays.adb
-- Date: Mon 01 Mar 2021 11:04:46 AM +08
-- Env : Linux HPEliteBook8470p-Ub2004-rt38 5.4.66-rt38
-- #1 SMP PREEMPT_RT Sat Sep 26 16:51:59 +08 2020 x86_64 x86_64 x86_64 GNU/Linux
-- Author  : WRY wruslandr@gmail.com
-- ========================================================
-- GNAT Studio Community 2020 (20200427) hosted on x86_64-pc-linux-gnu
-- GNAT 9.3.0 targetting x86_64-linux-gnu
-- SPARK Community 2020 (20200818) GNAT Studio (c) 2001-2020 AdaCore
-- AppIDE: /home/wruslan/opt/GNAT/2020/bin/gnatstudio
-- Version : 1.0 Mon 01 Mar 2021 11:04:46 AM +08
-- ========================================================
-- REF: https://stackoverflow.com/questions/55580931/how-do-i-dynamically-create-a-fixed-size-array-in-ada?rq=1

-- ========================================================
-- IMPORT STANDARD ADA PACKAGES 
with Ada.Text_IO;
with Ada.Integer_Text_IO; 
-- use Ada.Integer_Text_IO;

-- IMPORT USER-CREATED ADA PACKAGES 
with pkg_ada_date_time_stamp;

-- ========================================================
package body pkg_ada_dynsized_fixed2d_arrays
-- ========================================================
   with SPARK_Mode => on 
--   Note: SPARK_Mode cannot be turned on when using ART.Clock (that is volatile).
--   ART.Clock value is changing all the time (running hardware clock). 
is
   
   -- =====================================================
   -- RENAME STANDARD ADA PACKAGES 
   -- =====================================================
   package ATIO   renames Ada.Text_IO;
   package AITIO  renames Ada.Integer_Text_IO;
   
   -- =====================================================
   -- RENAME USER-CREATED ADA PACKAGES 
   -- =====================================================
   package PADTS  renames pkg_ada_date_time_stamp;
    
   -- =====================================================
   -- VARIABLES AND CONSTANTS PACKAGE-WIDE 
   -- =====================================================
   
    
   -- =====================================================
   -- FUNCTION IMPLEMENTATIONS FOR THIS PACKAGE 
   -- =====================================================
   function get_array2d_integer (dim1_min, dim1_max : Natural; 
                                 dim2_min, dim2_max : Natural)                            
                                 return typ_array2d_int  is  
   begin
      declare  -- INSIDE BEGIN
         Array2d_Int : typ_array2d_int (dim1_min .. dim1_max, 
                                        dim2_min .. dim2_max)
                     := (Others =>(Others => 0)); -- INITIALIZED ALL integer 0
      begin
         return Array2d_Int;   -- NOTE: This is the return object
      end; -- END declare
    
   end get_array2d_integer;  -- END function 

   -- ===================================================== 
   function get_array2d_float (dim1_min, dim1_max : Natural; 
                               dim2_min, dim2_max : Natural)                            
                               return typ_array2d_float  is  
   begin
      declare  -- INSIDE BEGIN
         Array2d_float : typ_array2d_float (dim1_min .. dim1_max, 
                                            dim2_min .. dim2_max)
                       := (Others =>(Others => 0.0)); -- INITIALIZED ALL float 0.0
      begin
         return Array2d_float;   -- NOTE: This is the return object
      end; -- END declare
    
   end get_array2d_float;  -- END function 

   -- =====================================================
   function get_array2d_character (dim1_min, dim1_max : Natural; 
                                   dim2_min, dim2_max : Natural)                            
                                   return typ_array2d_char  is  
   begin -- BEGIN FUNCTION
      declare  -- INSIDE BEGIN
         Array2d_char : typ_array2d_char (dim1_min .. dim1_max, 
                                          dim2_min .. dim2_max)
                      := (Others =>(Others => ' ')); -- INITIALIZED ALL char whitespece
      begin
         return Array2d_char;   -- NOTE: This is the return object
      end; -- END DECLARE
    
   end get_array2d_character;  -- END FUNCTION 

   -- =====================================================
   
-- ========================================================   
-- CLOSE PACKAGE   
-- ========================================================
begin
    null;
-- ========================================================
end pkg_ada_dynsized_fixed2d_arrays;
-- ========================================================
