# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class ExpirationYear < Field
        def initialize(value)
          super
          @value = @value&.to_i
        end

        private

        def strictly_valid?
          value = @value
          return false unless value.is_a?(Integer)

          value >= 2020 && value <= 2030
        end
      end
    end
  end
end
