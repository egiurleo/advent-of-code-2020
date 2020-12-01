# frozen_string_literal: true

module AdventOfCode2020
  # A module of commonly-used utility methods
  module Utils
    def self.read_file(file_name, transform: nil)
      path = File.join(AdventOfCode2020.root, '/', file_name)
      lines = File.readlines(path)

      result = lines
               .compact
               .map(&:strip)
               .reject(&:empty?)

      return result unless transform

      result.map(&transform)
    end
  end
end
