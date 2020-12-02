# frozen_string_literal: true

module AdventOfCode2020
  class Day02
    class NewPolicy < Policy
      def valid?(password)
        char_arr = password.split('')
        first_position = char_arr[@low - 1] == @letter
        second_position = char_arr[@high - 1] == @letter

        (first_position || second_position) && !(first_position && second_position)
      end
    end
  end
end
