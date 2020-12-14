# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day14::Decoder::Version2 do
  let(:program) do
    described_class.new(
      [
        'mask = 000000000000000000000000000000X1001X',
        'mem[42] = 100',
        'mask = 00000000000000000000000000000000X0XX',
        'mem[26] = 1'
      ]
    )
  end

  describe '#run' do
    it 'runs the program' do
      program.run

      expect(program.memory[16]).to eq(1)
      expect(program.memory[17]).to eq(1)
      expect(program.memory[18]).to eq(1)
      expect(program.memory[19]).to eq(1)
      expect(program.memory[24]).to eq(1)
      expect(program.memory[25]).to eq(1)
      expect(program.memory[26]).to eq(1)
      expect(program.memory[27]).to eq(1)
      expect(program.memory[58]).to eq(100)
      expect(program.memory[59]).to eq(100)
    end
  end

  describe '#follow_instruction' do
    it 'updates the bitmask' do
      program.follow_instruction
      expect(program.instance_variable_get(:@bitmask)).to eq('000000000000000000000000000000X1001X')
    end

    it 'writes values to memory' do
      2.times do
        program.follow_instruction
      end

      expect(program.memory[26]).to eq(100)
      expect(program.memory[27]).to eq(100)
      expect(program.memory[58]).to eq(100)
      expect(program.memory[59]).to eq(100)
    end

    it 'writes values to memory' do
      3.times do
        program.follow_instruction
      end

      expect(program.memory[26]).to eq(100)
      expect(program.memory[27]).to eq(100)
      expect(program.memory[58]).to eq(100)
      expect(program.memory[59]).to eq(100)
      expect(program.instance_variable_get(:@bitmask)).to eq('00000000000000000000000000000000X0XX')
    end

    it 'writes values to memory' do
      4.times do
        program.follow_instruction
      end

      expect(program.memory[16]).to eq(1)
      expect(program.memory[17]).to eq(1)
      expect(program.memory[18]).to eq(1)
      expect(program.memory[19]).to eq(1)
      expect(program.memory[24]).to eq(1)
      expect(program.memory[25]).to eq(1)
      expect(program.memory[26]).to eq(1)
      expect(program.memory[27]).to eq(1)
      expect(program.memory[58]).to eq(100)
      expect(program.memory[59]).to eq(100)
    end
  end
end
