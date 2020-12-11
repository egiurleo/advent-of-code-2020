# frozen_string_literal: true

require 'advent_of_code_2020/day_11/seat_simulator'
require 'advent_of_code_2020/day_11/seat'

module AdventOfCode2020
  class Day11
    def initialize(input_file)
      @lines = AdventOfCode2020::Utils.read_file(input_file)
    end

    def part_one
      seat_simulator = SeatSimulator.new(@lines)
      seat_simulator.run_until_stable
      seat_simulator.num_occupied_seats
    end

    def part_two
      seat_simulator = SeatSimulator.new(@lines)
      seat_simulator.run_until_stable(lenient: true)
      seat_simulator.num_occupied_seats
    end
  end
end
