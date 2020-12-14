# frozen_string_literal: true

module AdventOfCode2020
  class Day14
    module Decoder
      class Version2 < Version1
        attr_reader :memory

        BITMASK_LENGTH = 36

        def update_mask(mask)
          @bitmask = mask
        end

        def write(location, value)
          location_to_binary = location.to_s(2)
          full_binary =
            ('0' * (BITMASK_LENGTH - location_to_binary.length)) + location_to_binary

          @bitmask.split('').each_with_index do |char, idx|
            next if char == '0'

            full_binary[idx] = char
          end

          locations = all_binary_combinations(full_binary)
          locations.each do |loc|
            loc_i = loc.to_i(2)
            @memory[loc_i] = value
          end
        end

        private

        def all_binary_combinations(binary)
          return [binary] if binary.index('X').nil?

          x_index = binary.index('X')
          %w[0 1].each_with_object([]) do |num, arr|
            new_binary = binary.dup
            new_binary[x_index] = num

            arr.concat(all_binary_combinations(new_binary))
          end
        end
      end
    end
  end
end
