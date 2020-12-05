# frozen_string_literal: true

module AdventOfCode2020
  class Day04
    class Passport
      class Cid < Field
        def valid?(strict: false) # rubocop:disable Lint/UnusedMethodArgument
          true
        end
      end
    end
  end
end
