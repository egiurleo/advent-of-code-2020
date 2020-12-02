# frozen_string_literal: true

module AdventOfCode2020
  class Day02
    class Policy
      def initialize(policy)
        numbers, letter = policy.split
        raise 'Invalid policy' if numbers.nil? || letter.nil?

        low, high = numbers.split('-')
        @low = low.to_i unless low.nil?
        @high = high.to_i unless high.nil?

        @letter = letter
      end

      # Override me
      def valid?(_password)
        true
      end
    end
  end
end
