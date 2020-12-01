# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Utils do
  describe '.read_file' do
    let(:result) { described_class.read_file(file_name) }

    context 'when file is empty' do
      let(:file_name) { 'spec/mock_data/empty_file.txt' }

      it 'returns an empty array' do
        expect(result).to eq([])
      end
    end

    context 'when file has multiple lines' do
      let(:file_name) { 'spec/mock_data/file.txt' }

      it 'returns an array with every line' do
        expect(result).to be_a(Array)
        expect(result.length).to eq(4)

        expect(result[0]).to eq('Lorem ipsum dolor sit amet consectetur adipiscing elit.')
        expect(result[1]).to eq('Nulla libero enim, tempus id eleifend et, pellentesque ut dui.')
        expect(result[2]).to eq('Sed a tellus quis libero posuere rhoncus non quis nisi.')
        expect(result[3]).to eq('Proin tristique interdum lacinia.')
      end
    end

    context 'when file has whitespace at beginning and end of line' do
      let(:file_name) { 'spec/mock_data/whitespace_file.txt' }

      it 'returns an array of lines with no whitespace at beginning or end of line' do
        expect(result).to be_a(Array)
        expect(result.length).to eq(4)

        expect(result[0]).to eq('Lorem ipsum dolor sit amet consectetur adipiscing elit.')
        expect(result[1]).to eq('Nulla libero enim, tempus id eleifend et, pellentesque ut dui.')
        expect(result[2]).to eq('Sed a tellus quis libero posuere rhoncus non quis nisi.')
        expect(result[3]).to eq('Proin tristique interdum lacinia.')
      end
    end

    context 'when file has integers' do
      let(:file_name) { 'spec/mock_data/integers.txt' }
      let(:result) { described_class.read_file(file_name, transform: :to_i) }

      it 'returns an array of integers' do
        expect(result).to be_a(Array)
        expect(result.length).to eq(5)

        expect(result).to eq([1, 2, 3, 4, 5])
      end
    end
  end
end
