# frozen_string_literal: true

module AdventOfCode2020
  class Day01
    class SumFinder
      def initialize(arr, target)
        @arr = arr
        @target = target
      end

      # Find two elements in the provided array whose sum is equal to target
      def find_two
        # @type var hash: Hash[Integer,(nil|Integer)]
        hash = @arr.each_with_object({}) do |el, obj|
          obj[el] = 1
        end

        @arr.each do |el|
          return [el, @target - el] if hash[@target - el]
        end

        nil
      end

      # Find three elements in the provided array whose sum is equal to target
      def find_three
        # @type var hash: Hash[Integer,Array[Integer]]
        hash =
          @arr.combination(2).to_a.each_with_object({}) do |pair, obj|
            first, second = pair
            next if first.nil? || second.nil?

            obj[first + second] = [first, second]
          end

        @arr.each do |el|
          next if hash[@target - el].nil?

          first, second = hash[@target - el]
          next if first.nil? || second.nil?

          return [el, first, second]
        end

        nil
      end
    end
  end
end
