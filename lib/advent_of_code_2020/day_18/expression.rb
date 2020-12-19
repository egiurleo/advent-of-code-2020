# frozen_string_literal: true

module AdventOfCode2020
  class Day18
    class Expression
      def initialize(expression)
        @expression = expression
      end

      def evaluate
        evaluate_recursive(reverse)
      end

      private

      def evaluate_recursive(expression)
        return expression.to_i if single_number?(expression)

        expression = remove_opening_and_closing_parentheses(expression)
        _, closing_paren = parentheses_indices(expression)

        operator_index = expression.index(/\+|\*/, closing_paren)
        operator = expression[operator_index]
        side1 = expression[0...operator_index].strip
        side2 = expression[operator_index + 1..].strip

        case operator
        when '+'
          evaluate_recursive(side1) + evaluate_recursive(side2)
        when '*'
          evaluate_recursive(side1) * evaluate_recursive(side2)
        else
          raise "Invalid operator: #{operator}"
        end
      end

      def single_number?(expression)
        expression.split('*').length == 1 &&
          expression.split('+').length == 1 &&
          expression.index('(').nil?
      end

      def parentheses_indices(expression)
        return [0, 0] unless expression[0].index('(')

        opening_parens = 0
        expression.split('').each_with_index do |char, idx|
          opening_parens += 1 if char == '('
          opening_parens -= 1 if char == ')'

          return [0, idx] if opening_parens.zero?
        end
      end

      def remove_opening_and_closing_parentheses(expression)
        opening_paren, closing_paren = parentheses_indices(expression)
        return expression unless opening_paren && closing_paren == expression.length - 1

        expression[1...expression.length - 1]
      end

      def reverse
        @expression
          .reverse
          .gsub('(', '[')
          .gsub(')', '(')
          .gsub('[', ')')
      end
    end
  end
end
