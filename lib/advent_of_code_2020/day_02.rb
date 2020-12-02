# frozen_string_literal: true

require 'advent_of_code_2020/day_02/policy'
require 'advent_of_code_2020/day_02/old_policy'
require 'advent_of_code_2020/day_02/new_policy'

module AdventOfCode2020
  class Day02
    def initialize(input_file)
      @passwords = AdventOfCode2020::Utils.read_file(input_file)
    end

    # Each line gives the password policy and then the password.
    # The password policy indicates the lowest and highest number of times a
    # given letter must appear for the password to be valid. For example, 1-3 a
    # means that the password must contain a at least 1 time and at most 3 times.
    #
    # How many passwords are valid according to their policies?
    def part_one
      count_valid_passwords(OldPolicy)
    end

    # Each policy actually describes two positions in the password, where 1
    # means the first character, 2 means the second character, and so on.
    # (Be careful; Toboggan Corporate Policies have no concept of "index zero"!)
    # Exactly one of these positions must contain the given letter.
    #
    # How many passwords are valid according to the new interpretation of the policies?
    def part_two
      count_valid_passwords(NewPolicy)
    end

    private

    def count_valid_passwords(policy_class)
      @passwords.map do |pw|
        policy_string, password_string = pw.split(': ')
        [policy_string, password_string]
      end.select do |policy_string, password_string|
        next if policy_string.nil? || password_string.nil?

        policy_class.new(policy_string).valid?(password_string)
      end.length
    end
  end
end
