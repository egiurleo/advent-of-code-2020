# frozen_string_literal: true

module AdventOfCode2020
  class Day16
    class TicketValidator
      def initialize(rules)
        @rules = rules.each_with_object({}) do |rule, hash|
          field, values = rule.split(':').map(&:strip)

          hash[field] = values.split(' or ').map do |val|
            (val.split('-').first.to_i..val.split('-').last.to_i)
          end
        end
      end

      def invalid_values(ticket)
        ticket.values.select do |value|
          @rules.values.all? do |ranges|
            ranges.none? { |range| range.include?(value) }
          end
        end
      end

      def valid?(ticket)
        invalid_values(ticket).empty?
      end

      def assigned_fields(tickets)
        return @assigned_fields if @assigned_fields

        possible_fields = tickets
                          .first
                          .values
                          .each_with_index
                          .each_with_object({}) { |(_, idx), hash| hash[idx] = @rules.keys.dup }

        tickets.each do |ticket|
          ticket.values.each_with_index do |_, val_idx|
            invalid_rules(ticket, val_idx).each do |invalid_rule|
              possible_fields[val_idx].delete(invalid_rule)
            end
          end
        end

        @assigned_fields = {}
        while possible_fields.length.positive?
          assigned_field = possible_fields.find { |_idx, fields| fields.length == 1 }
          assigned_field_idx = assigned_field.first
          assigned_field_name = assigned_field.last.first

          @assigned_fields[assigned_field_idx] = assigned_field_name

          possible_fields.delete(assigned_field_idx)
          possible_fields.each_value { |fields| fields.delete(assigned_field_name) }
        end

        @assigned_fields
      end

      private

      def invalid_rules(ticket, idx)
        value = ticket.values[idx]
        @rules.each_pair.select do |_field, ranges|
          ranges.none? { |range| range.include?(value) }
        end.map(&:first)
      end
    end
  end
end
