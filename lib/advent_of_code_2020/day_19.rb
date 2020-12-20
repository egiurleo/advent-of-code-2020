# frozen_string_literal: true

require 'advent_of_code_2020/day_19/message_validator'

module AdventOfCode2020
  class Day19
    def initialize(input_file)
      lines = AdventOfCode2020::Utils.read_file(input_file)

      @rules = []
      @messages = []
      num_blank_lines = 0

      lines.each do |line|
        num_blank_lines += 1 and next if line.empty?

        @rules << line if num_blank_lines.zero?
        @messages << line if num_blank_lines == 1
      end
    end

    def part_one
      validator = MessageValidator.new(@rules)
      @messages.select do |message|
        validator.valid?(message)
      end.length
    end

    def part_two(depth: 1)
      validator = MessageValidator.new(@rules, new_rules: true, depth: depth)
      @messages.select do |message|
        validator.valid?(message)
      end.length
    end
  end
end
