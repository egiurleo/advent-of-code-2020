# frozen_string_literal: true

module AdventOfCode2020
  class Day11
    class Seat
      STATES = %i[empty occupied floor].freeze

      attr_reader :row, :col, :state

      def initialize(row, col, state)
        raise "Invalid state: #{state}" unless STATES.include?(state)

        @row = row
        @col = col
        @state = state
      end

      def ==(other)
        row == other.row && col == other.col && state == other.state
      end

      def empty?
        state == :empty
      end

      def occupied?
        state == :occupied
      end

      def floor?
        state == :floor
      end

      def empty
        raise 'Cannot empty floor' if floor?

        @state = :empty
      end

      def occupy
        raise 'Cannot occupy floor' if floor?

        @state = :occupied
      end
    end
  end
end
