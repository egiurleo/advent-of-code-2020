# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class HairColor < Field
        private

        def strictly_valid?
          !!(@value =~ /\A#([0-9a-f]){6}\z/)
        end
      end
    end
  end
end
