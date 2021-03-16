# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day21::FoodProcessor do
  let(:processor) { described_class.new(foods) }
  let(:foods) do
    [
      AdventOfCode2020::Day21::Food.new(%w[aaa bbb ccc ddd], %w[dairy fish]),
      AdventOfCode2020::Day21::Food.new(%w[eee fff ggg aaa], %w[dairy]),
      AdventOfCode2020::Day21::Food.new(%w[ccc fff], %w[soy]),
      AdventOfCode2020::Day21::Food.new(%w[ccc aaa ggg], %w[fish])
    ]
  end

  describe '#ingredients_without_allergens' do
    it 'returns the ingredients that have no allergens' do
      expect(processor.ingredients_without_allergens).to match_array(%w[bbb ddd ggg eee])
    end
  end

  describe '#ingredients_to_allergens' do
    it 'returns the ingredients mapped to their allergen' do
      expect(processor.ingredients_to_allergens).to eq({
                                                         'aaa' => 'dairy',
                                                         'ccc' => 'fish',
                                                         'fff' => 'soy'
                                                       })
    end
  end
end
