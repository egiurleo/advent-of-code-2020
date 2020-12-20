# frozen_string_literal: true

module AdventOfCode2020
  class Day19
    class MessageValidator
      def initialize(lines, new_rules: false, depth: 1)
        @initial_rules = lines.each_with_object({}) do |line, hash|
          number, rule = line.split(':').map(&:strip)
          hash[number.to_i] = rule
        end

        if new_rules
          @initial_rules[8] = '42 | 42 8'
          @initial_rules[11] = '42 31 | 42 11 31'
        end

        @new = new_rules
        @depth = depth
        @depth8 = 0
        @depth11 = 0
        @rules = {}

        process_rules(0)
      end

      def valid?(message)
        regex = "\\A#{@rules[0]}\\z"
        !(message =~ /#{regex}/).nil?
      end

      private

      def process_rules(rule)
        return rule if rule == '|'
        return rule if rule == '(.)'

        rule = rule.to_i
        @depth8 += 1 if rule == 8 && @new
        @depth11 += 1 if rule == 11 && @new

        if @new && (rule == 8 && @depth8 >= @depth) ||
           (rule == 11 && @depth11 >= @depth)
          return '(.*)'
        end

        return @rules[rule] if @rules[rule]

        return @rules[rule] = @initial_rules[rule].delete('"') if (@initial_rules[rule] =~ /[0-9]/).nil?

        new_rule = @initial_rules[rule].split.map do |subrule|
          process_rules(subrule)
        end.join
        new_rule = "(#{new_rule})"

        @rules[rule] = new_rule
        new_rule
      end
    end
  end
end
