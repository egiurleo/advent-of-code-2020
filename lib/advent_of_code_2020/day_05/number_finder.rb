# frozen_string_literal: true

module AdventOfCode2020
  class Day05
    module NumberFinder
      def self.find_number(min:, max:, up_char:, down_char:, pattern:)
        pattern.split('').each do |letter|
          case letter
          when up_char
            min += ((max - min) / 2.0).ceil
          when down_char
            max -= ((max - min) / 2.0).ceil
          else
            raise 'Invalid character'
          end
        end

        min
      end

      def self.find_missing_number(list)
        list = list.sort

        min_val = list.first

        raise if min_val.nil?

        min_idx = 0
        max_idx = list.length - 1

        while min_idx < max_idx - 1
          mid_idx = min_idx + ((max_idx - min_idx) / 2.0).floor

          if list[mid_idx] == mid_idx + min_val
            min_idx = mid_idx
          else
            max_idx = mid_idx
          end
        end

        min_val + max_idx
      end
    end
  end
end
