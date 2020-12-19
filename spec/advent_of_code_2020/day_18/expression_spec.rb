# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day18::Expression do
  describe '#evaluate' do
    it 'evaluates an expression of one number' do
      expression = described_class.new('2')
      expect(expression.evaluate).to eq(2)
    end

    it 'evaluates an expression with addition' do
      expression = described_class.new('2 + 3')
      expect(expression.evaluate).to eq(5)
    end

    it 'evaluates an expression with multiplication' do
      expression = described_class.new('2 * 3')
      expect(expression.evaluate).to eq(6)
    end

    it 'evaluates an expression with the correct order of operations' do
      expression = described_class.new('1 + 2 * 3')
      expect(expression.evaluate).to eq(9)
    end

    it 'evaluates an expression with parentheses' do
      expression = described_class.new('1 + (2 * 3)')
      expect(expression.evaluate).to eq(7)
    end

    it 'evaluates an expression with parentheses that come first' do
      expression = described_class.new('(2 * 3) + 1')
      expect(expression.evaluate).to eq(7)
    end

    it 'evaluates an expression with nested parentheses' do
      expression = described_class.new('(2 * (3 + 4) + 1)')
      expect(expression.evaluate).to eq(15)
    end

    it 'evaluates an expression with two sets of parentheses' do
      expression = described_class.new('(2 * 3) + (3 * 4)')
      expect(expression.evaluate).to eq(18)
    end

    it 'evaluates an expression with nested parentheses 3 levels deep' do
      expression = described_class.new('(3 * (3 + (5 * 2)))')
      expect(expression.evaluate).to eq(39)
    end

    it 'evaluates an expression with many parentheses' do
      expression = described_class.new('1 + (2 * 3) + (4 * (5 + 6))')
      expect(expression.evaluate).to eq(51)
    end

    it 'evaluates an expression' do
      expression = described_class.new('2 * 3 + (4 * 5)')
      expect(expression.evaluate).to eq(26)
    end

    it 'evaluates an expression' do
      expression = described_class.new('5 + (8 * 3 + 9 + 3 * 4 * 3)')
      expect(expression.evaluate).to eq(437)
    end

    it 'evaluates an expression' do
      expression = described_class.new('5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))')
      expect(expression.evaluate).to eq(12_240)
    end

    it 'evaluates complicated expressions' do
      expression = described_class.new('((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2')
      expect(expression.evaluate).to eq(13_632)
    end
  end
end
