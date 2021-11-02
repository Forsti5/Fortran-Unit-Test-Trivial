module test_operatos_mod
   use operators_mod
   use funit
   implicit none
   
contains
   
   @suite(name='test_operators_suite')

   @test
   subroutine test_add_numbers()

      real(8) :: res

      call add_numbers(1.0d0, 2.0d0, res)
      @assertEqual(res, 3.0d0)

   end subroutine test_add_numbers
   
   
   @test
   subroutine test_subtract_numbers()

      real(8) :: res

      call subtract_numbers(2.0d0, 1.0d0, res)
      @assertEqual(res, 1.0d0)

   end subroutine test_subtract_numbers
   
end module test_operatos_mod
