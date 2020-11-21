module AdventOfCode2020
  def self.root
    dir = __dir__

    if dir.nil?
      raise '__dir__ is nil; __dir__ must return a valid path to current directory'
    end

    File.join(dir, '/..')
  end
end

require 'advent_of_code_2020/utils.rb'
