# frozen_string_literal: true

module AdventOfCode2020
  class Day09
    class XmasStream
      def initialize(numbers, preamble_length: 25)
        @numbers = numbers
        @preamble_length = preamble_length
        @relevant_numbers = @numbers[0..@preamble_length - 1].each_with_object({}) do |number, obj|
          obj[number] = true
        end
      end

      def first_invalid_number
        @numbers[@preamble_length..].each_with_index do |number, idx|
          valid_number = false

          @numbers[idx..idx + @preamble_length - 1].each do |number2|
            if @relevant_numbers[number - number2]
              valid_number = true
              break
            end
          end

          return number unless valid_number

          @relevant_numbers.delete(@numbers[idx])
          @relevant_numbers[@numbers[idx + @preamble_length]] = true
        end
      end

      def contiguous_set_that_sums_to(number)
        matrix = {}

        @numbers.each_with_index do |number1, starting|
          @numbers.each_with_index do |number2, ending|
            if starting == ending
              matrix[[starting, ending]] = number1
            elsif starting < ending
              matrix[[starting, ending]] = matrix[[starting, ending - 1]] + number2
            end
          end
        end

        matrix.each_pair do |coords, sum|
          starting, ending = coords
          return @numbers[starting..ending] if sum == number
        end
      end
    end
  end
end
