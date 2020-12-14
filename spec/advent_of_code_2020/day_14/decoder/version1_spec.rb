# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day14::Decoder::Version1 do
  let(:program) do
    described_class.new(
      [
        'mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X',
        'mem[8] = 11',
        'mem[7] = 101',
        'mem[8] = 0'
      ]
    )
  end

  describe '#run' do
    it 'runs the program' do
      program.run

      expect(program.instance_variable_get(:@bitmask)).to eq({ 29 => '1', 34 => '0' })
      expect(program.memory[8]).to eq(64)
      expect(program.memory[7]).to eq(101)
    end
  end

  describe '#follow_instruction' do
    it 'updates the bitmask' do
      program.follow_instruction
      expect(program.instance_variable_get(:@bitmask)).to eq({ 29 => '1', 34 => '0' })
    end

    it 'writes values to memory' do
      2.times do
        program.follow_instruction
      end

      expect(program.instance_variable_get(:@bitmask)).to eq({ 29 => '1', 34 => '0' })
      expect(program.memory[8]).to eq(73)
    end

    it 'writes values to memory' do
      3.times do
        program.follow_instruction
      end

      expect(program.instance_variable_get(:@bitmask)).to eq({ 29 => '1', 34 => '0' })
      expect(program.memory[8]).to eq(73)
      expect(program.memory[7]).to eq(101)
    end

    it 'writes values to memory' do
      4.times do
        program.follow_instruction
      end

      expect(program.instance_variable_get(:@bitmask)).to eq({ 29 => '1', 34 => '0' })
      expect(program.memory[8]).to eq(64)
      expect(program.memory[7]).to eq(101)
    end
  end
end
