# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class EyeColor < Field
        VALID_COLORS = %w[amb blu brn gry grn hzl oth].freeze

        private

        def strictly_valid?
          VALID_COLORS.include?(@value)
        end
      end
    end
  end
end
