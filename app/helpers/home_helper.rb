module HomeHelper

=begin
  
row 0   ========>   % 4 = 0
row 1           |   % 4 = 1
row 2   <========   % 4 = 2
row 3   |           % 4 = 3
row 4   ========>   % 4 = 0
                
=end

  def horizontal?(row_num)
    horizontal_right?(row_num) || horizontal_left?(row_num)
  end

  def horizontal_right?(row_num)
    row_num % 4 == 0
  end

  def horizontal_left?(row_num)
    row_num % 4 == 2
  end

  def vertical?(row_num)
    vertical_right?(row_num) || vertical_left?(row_num)
  end

  def vertical_right?(row_num)
    row_num % 4 == 1
  end

  def vertical_left?(row_num)
    row_num % 4 == 3
  end

end