# frozen_string_literal: true

require 'advent_of_code_2020/day_06/group'

module AdventOfCode2020
  class Day06
    def initialize(input_file)
      @groups = []
      group_lines = []

      AdventOfCode2020::Utils.read_file(input_file).map do |line|
        if line == ''
          @groups << Group.new(group_lines)
          group_lines = []
        else
          group_lines << line
        end
      end

      @groups << Group.new(group_lines)
    end

    # For each group, count the number of questions to which anyone answered "yes".
    # What is the sum of those counts?
    def part_one
      @groups.map(&:number_questions_answered).reduce(:+)
    end

    # For each group, count the number of questions to which everyone answered
    # "yes". What is the sum of those counts?
    def part_two
      @groups.map(&:number_questions_everybody_answered).reduce(:+)
    end
  end
end
