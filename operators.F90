module operators_mod

   implicit none

   public add_numbers
   public subtract_numbers

   private

contains

   subroutine add_numbers(value1, value2, res)

      real(8), intent(in)  :: value1
      real(8), intent(in)  :: value2
      real(8), intent(out) :: res

      res = value1 + value2

   end subroutine
   
   subroutine subtract_numbers(value1, value2, res)

      real(8), intent(in)  :: value1
      real(8), intent(in)  :: value2
      real(8), intent(out) :: res

      res = value1 - value2

   end subroutine

end module
