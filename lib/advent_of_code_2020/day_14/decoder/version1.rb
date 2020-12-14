# frozen_string_literal: true

module AdventOfCode2020
  class Day14
    module Decoder
      class Version1
        attr_reader :memory

        BITMASK_LENGTH = 36

        def initialize(instructions)
          @instructions = instructions
          @bitmask = {}
          @memory = {}
        end

        def follow_instruction
          instruction = @instructions.shift
          command, value = instruction.split(' = ')

          case command
          when 'mask'
            update_mask(value)
          else
            location = command.match(/\[([0-9]*)\]/i).captures.first
            write(location.to_i, value.to_i)
          end
        end

        def run
          follow_instruction until @instructions.empty?
        end

        def update_mask(mask)
          @bitmask = {}

          mask.split('').each_with_index do |char, idx|
            next if char == 'X'

            @bitmask[idx] = char
          end
        end

        def write(location, value)
          value_to_binary = value.to_s(2)
          full_binary =
            ('0' * (BITMASK_LENGTH - value_to_binary.length)) + value_to_binary

          @bitmask.each_pair do |pos, val|
            full_binary[pos] = val
          end

          @memory[location] = full_binary.to_i(2)
        end
      end
    end
  end
end
