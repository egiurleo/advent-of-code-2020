# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class Field
        def initialize(value)
          @value = value
        end

        def valid?(strict: false)
          return false unless @value

          if strict
            strictly_valid?
          else
            true
          end
        end

        private

        def strictly_valid?
          true
        end
      end
    end
  end
end
