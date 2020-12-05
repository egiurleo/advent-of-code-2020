# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class BirthYear < Field
        def initialize(value)
          super
          @value = @value&.to_i
        end

        private

        def strictly_valid?
          value = @value
          return false unless value.is_a?(Integer)

          value >= 1920 && value <= 2002
        end
      end
    end
  end
end
