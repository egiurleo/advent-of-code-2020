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
require 'advent_of_code_2020/day_11'
require 'advent_of_code_2020/day_12'
require 'advent_of_code_2020/day_13'
require 'advent_of_code_2020/day_14'
require 'advent_of_code_2020/day_15'
require 'advent_of_code_2020/day_16'
require 'advent_of_code_2020/day_17'
require 'advent_of_code_2020/day_18'
require 'advent_of_code_2020/day_19'
require 'advent_of_code_2020/day_21'
require 'advent_of_code_2020/day_22'
