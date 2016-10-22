module HomeHelper

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