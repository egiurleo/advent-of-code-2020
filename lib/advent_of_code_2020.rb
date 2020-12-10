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
require 'advent_of_code_2020/day_05'
require 'advent_of_code_2020/day_06'
require 'advent_of_code_2020/day_07'
require 'advent_of_code_2020/day_08'
require 'advent_of_code_2020/day_09'
require 'advent_of_code_2020/day_10'
