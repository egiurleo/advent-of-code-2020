# frozen_string_literal: true

require 'advent_of_code_2020/day_12/ship'
require 'advent_of_code_2020/day_12/waypoint'
require 'advent_of_code_2020/day_12/navigation_system'
require 'advent_of_code_2020/day_12/new_navigation_system'

module AdventOfCode2020
  class Day12
    def initialize(input_file)
      @instructions = AdventOfCode2020::Utils.read_file(input_file)
    end

    def part_one
      navigation_system = NavigationSystem.new(@instructions)
      navigation_system.follow_all_instructions
      navigation_system.ship.manhattan_distance
    end

    def part_two
      navigation_system = NewNavigationSystem.new(@instructions)
      navigation_system.follow_all_instructions
      navigation_system.ship.manhattan_distance
    end
  end
end
