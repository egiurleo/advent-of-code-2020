# frozen_string_literal: true

module AdventOfCode2020
  class Day06
    class Group
      def initialize(lines)
        @number_people = lines.length
        @questions_answered = Hash.new(0)

        lines.each do |line|
          questions = line.split('')
          questions.each do |question|
            @questions_answered[question] += 1
          end
        end
      end

      def number_questions_answered
        @questions_answered.length
      end

      def number_questions_everybody_answered
        @questions_answered.count do |_, val|
          val == @number_people
        end
      end
    end
  end
end
