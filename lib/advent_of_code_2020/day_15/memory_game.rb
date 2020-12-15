# frozen_string_literal: true

module AdventOfCode2020
  class Day15
    class MemoryGame
      def initialize(starting_numbers)
        @starting_numbers = starting_numbers.dup
        @last_number_spoken = nil
        @last_time_spoken = {}
        @second_to_last_time_spoken = {}
        @number_times_spoken = Hash.new(0)
        @turn = 0
      end

      def turn
        @turn += 1

        number = if @starting_numbers.empty?
                   if @number_times_spoken[@last_number_spoken] == 1
                     0
                   else
                     @last_time_spoken[@last_number_spoken] -
                       @second_to_last_time_spoken[@last_number_spoken]
                   end
                 else
                   @starting_numbers.shift
                 end

        @second_to_last_time_spoken[number] =
          @last_time_spoken[number]
        @last_time_spoken[number] = @turn
        @number_times_spoken[number] += 1
        @last_number_spoken = number

        number
      end
    end
  end
end
