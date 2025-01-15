=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end


class Grid

  def self.saddle_points(input)
    indices_of_max_values_in_row = []
    input.each_with_index do |row, input_index|
      max = row.max
      row.each_with_index do |val, row_index|
        if val == max
          indices_of_max_values_in_row << [input_index, row_index]
        end
      end
    end

    cols = input.transpose
    indices_of_lowest_in_cols = []
    cols.each_with_index do |col, cols_index|
      min = col.min
      col.each_with_index do |val, nested_index|
        if val == min
          indices_of_lowest_in_cols << [nested_index, cols_index]
        end
      end
    end

    matching_items = indices_of_max_values_in_row.select { |item| indices_of_lowest_in_cols.include?(item) }
    result = []
    matching_items.each do |item|
      result << {"row" => item[0] + 1, "column" => item[1] + 1}
    end
    result
  end
end
