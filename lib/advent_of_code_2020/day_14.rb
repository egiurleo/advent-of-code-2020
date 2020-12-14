# frozen_string_literal: true

require 'advent_of_code_2020/day_14/decoder/version1'
require 'advent_of_code_2020/day_14/decoder/version2'

module AdventOfCode2020
  class Day14
    def initialize(input_file)
      @instructions = AdventOfCode2020::Utils.read_file(input_file)
    end

    def part_one
      program = Decoder::Version1.new(@instructions)
      program.run
      program.memory.values.sum
    end

    def part_two
      program = Decoder::Version2.new(@instructions)
      program.run
      program.memory.values.sum
    end
  end
end
