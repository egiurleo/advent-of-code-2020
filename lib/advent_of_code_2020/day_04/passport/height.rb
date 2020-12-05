# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class Height < Field
        def initialize(value)
          super

          value_split = value&.split('')
          @units = value_split&.last(2)&.join
          @value = value_split[0...-2]&.join.to_i unless value_split.nil?
        end

        private

        def strictly_valid?
          return false unless %w[in cm].include?(@units)

          value = @value
          return false unless value.is_a?(Integer)

          if @units == 'in'
            value >= 59 && value <= 76
          else
            value >= 150 && value <= 193
          end
        end
      end
    end
  end
end
