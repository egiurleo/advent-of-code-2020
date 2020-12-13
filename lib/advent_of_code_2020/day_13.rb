# frozen_string_literal: true

require 'advent_of_code_2020/day_13/bus_scheduler'

module AdventOfCode2020
  class Day13
    def initialize(input_file)
      line1, line2 = AdventOfCode2020::Utils.read_file(input_file)
      @arrival_time = line1.to_i
      @bus_ids = line2.split(',').map { |id| id == 'x' ? id : id.to_i }
    end

    def part_one
      id, wait_time = @bus_ids.reject { |elem| elem == 'x' }.map do |id|
        [id, BusScheduler.wait_time(@arrival_time, id)]
      end.min_by(&:last)

      id * wait_time
    end

    def part_two
      BusScheduler.earliest_timestamp(@bus_ids)
    end
  end
end
