# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class Pid < Field
        private

        def strictly_valid?
          !(@value =~ /\A[0-9]{9}\z/).nil?
        end
      end
    end
  end
end
