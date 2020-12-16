# frozen_string_literal: true

require 'advent_of_code_2020/day_16/ticket'
require 'advent_of_code_2020/day_16/ticket_validator'

module AdventOfCode2020
  class Day16
    def initialize(input_file)
      rules = []
      your_ticket = nil
      nearby_tickets = []

      empty_lines_encountered = 0

      AdventOfCode2020::Utils.read_file(input_file).each do |line|
        empty_lines_encountered += 1 and next if line == ''

        rules << line if empty_lines_encountered.zero?

        your_ticket = line.split(',').map(&:to_i) if empty_lines_encountered == 1 && line != 'your ticket:'

        nearby_tickets << line.split(',').map(&:to_i) if empty_lines_encountered == 2 && line != 'nearby tickets:'
      end

      @validator = TicketValidator.new(rules)
      @your_ticket = Ticket.new(your_ticket)
      @nearby_tickets = nearby_tickets.map { |ticket| Ticket.new(ticket) }
    end

    def part_one
      @nearby_tickets.map do |ticket|
        @validator.invalid_values(ticket)
      end.flatten.sum
    end

    def part_two
      valid_tickets = @nearby_tickets.select do |ticket|
        @validator.valid?(ticket)
      end

      assigned_fields = @validator.assigned_fields(valid_tickets)
      assigned_fields
        .reject { |_, name| (name =~ /\Adeparture/).nil? }
        .map { |idx, _| @your_ticket.values[idx] }.reduce(:*)
    end
  end
end
