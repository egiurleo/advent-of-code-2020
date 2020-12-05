# frozen_string_literal: true

module AdventOfCode2020
  def self.root
    dir = __dir__

    raise '__dir__ is nil; __dir__ must return a valid path to current directory' if dir.nil?

    File.join(dir, '/..')
  end
end

require 'advent_of_code_2020/utils'
require 'advent_of_code_2020/day_01'
require 'advent_of_code_2020/day_02'
require 'advent_of_code_2020/day_03'
require 'advent_of_code_2020/day_04'
