# frozen_string_literal: true

require 'advent_of_code_2020/day_09/xmas_stream'

module AdventOfCode2020
  class Day09
    def initialize(input_file)
      @numbers = AdventOfCode2020::Utils.read_file(input_file, transform: :to_i)
      @xmas_stream = XmasStream.new(@numbers)
    end

    def part_one
      @part_one ||= @xmas_stream.first_invalid_number
    end

    def part_two
      range = @xmas_stream.contiguous_set_that_sums_to(part_one)
      range.min + range.max
    end
  end
end
