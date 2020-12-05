# frozen_string_literal: true

require 'advent_of_code_2020/day_05/number_finder'
require 'advent_of_code_2020/day_05/seat'

module AdventOfCode2020
  class Day05
    def initialize(input_file)
      @seats = AdventOfCode2020::Utils.read_file(input_file).map do |line|
        Seat.new(line)
      end
    end

    # As a sanity check, look through your list of boarding passes.
    # What is the highest seat ID on a boarding pass?
    def part_one
      max = @seats.map(&:id).max
      raise if max.nil?

      max
    end

    # It's a completely full flight, so your seat should be the only missing
    # boarding pass in your list. However, there's a catch: some of the seats at
    # the very front and back of the plane don't exist on this aircraft, so
    # they'll be missing from your list as well.
    #
    # Your seat wasn't at the very front or back, though; the seats with IDs +1
    # and -1 from yours will be in your list.
    #
    # What is the ID of your seat?
    def part_two
      ids = @seats.map(&:id)
      NumberFinder.find_missing_number(ids)
    end
  end
end
