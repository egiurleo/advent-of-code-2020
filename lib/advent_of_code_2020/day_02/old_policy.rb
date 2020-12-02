# frozen_string_literal: true

module AdventOfCode2020
  class Day02
    class OldPolicy < Policy
      def valid?(password)
        number = password.split('').select { |char| char == @letter }.length
        number >= @low && number <= @high
      end
    end
  end
end
