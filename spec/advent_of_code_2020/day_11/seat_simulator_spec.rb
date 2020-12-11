# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2020::Day11::SeatSimulator do
  let(:seat_simulator) do
    described_class.new(
      [
        'L.LL.LL.LL',
        'LLLLLLL.LL',
        'L.L.L..L..',
        'LLLL.LL.LL',
        'L.LL.LL.LL',
        'L.LLLLL.LL',
        '..L.L.....',
        'LLLLLLLLLL',
        'L.LLLLLL.L',
        'L.LLLLL.LL'
      ]
    )
  end

  describe '#to_s' do
    it 'returns a string representation of the seats' do
      expect(seat_simulator.to_s).to eq(
        "L.LL.LL.LL\n" \
        "LLLLLLL.LL\n" \
        "L.L.L..L..\n" \
        "LLLL.LL.LL\n" \
        "L.LL.LL.LL\n" \
        "L.LLLLL.LL\n" \
        "..L.L.....\n" \
        "LLLLLLLLLL\n" \
        "L.LLLLLL.L\n" \
        "L.LLLLL.LL\n"
      )
    end
  end

  describe '#round' do
    context 'when lenient is true' do
      it 'returns the correct state after one round' do
        seat_simulator.round(lenient: true)

        expect(seat_simulator.to_s).to eq(
          "#.##.##.##\n" \
          "#######.##\n" \
          "#.#.#..#..\n" \
          "####.##.##\n" \
          "#.##.##.##\n" \
          "#.#####.##\n" \
          "..#.#.....\n" \
          "##########\n" \
          "#.######.#\n" \
          "#.#####.##\n"
        )
      end

      it 'returns the correct state after two rounds' do
        2.times do
          seat_simulator.round(lenient: true)
        end

        expect(seat_simulator.to_s).to eq(
          "#.LL.LL.L#\n" \
          "#LLLLLL.LL\n" \
          "L.L.L..L..\n" \
          "LLLL.LL.LL\n" \
          "L.LL.LL.LL\n" \
          "L.LLLLL.LL\n" \
          "..L.L.....\n" \
          "LLLLLLLLL#\n" \
          "#.LLLLLL.L\n" \
          "#.LLLLL.L#\n"
        )
      end

      it 'returns the correct state after three rounds' do
        3.times do
          seat_simulator.round(lenient: true)
        end

        expect(seat_simulator.to_s).to eq(
          "#.L#.##.L#\n" \
          "#L#####.LL\n" \
          "L.#.#..#..\n" \
          "##L#.##.##\n" \
          "#.##.#L.##\n" \
          "#.#####.#L\n" \
          "..#.#.....\n" \
          "LLL####LL#\n" \
          "#.L#####.L\n" \
          "#.L####.L#\n"
        )
      end
    end

    it 'returns the correct state after one round' do
      seat_simulator.round

      expect(seat_simulator.to_s).to eq(
        "#.##.##.##\n" \
        "#######.##\n" \
        "#.#.#..#..\n" \
        "####.##.##\n" \
        "#.##.##.##\n" \
        "#.#####.##\n" \
        "..#.#.....\n" \
        "##########\n" \
        "#.######.#\n" \
        "#.#####.##\n"
      )
    end

    it 'returns the correct state after two rounds' do
      seat_simulator.round
      seat_simulator.round

      expect(seat_simulator.to_s).to eq(
        "#.LL.L#.##\n" \
        "#LLLLLL.L#\n" \
        "L.L.L..L..\n" \
        "#LLL.LL.L#\n" \
        "#.LL.LL.LL\n" \
        "#.LLLL#.##\n" \
        "..L.L.....\n" \
        "#LLLLLLLL#\n" \
        "#.LLLLLL.L\n" \
        "#.#LLLL.##\n"
      )
    end

    it 'returns the correct state after two rounds' do
      3.times do
        seat_simulator.round
      end

      expect(seat_simulator.to_s).to eq(
        "#.##.L#.##\n" \
        "#L###LL.L#\n" \
        "L.#.#..#..\n" \
        "#L##.##.L#\n" \
        "#.##.LL.LL\n" \
        "#.###L#.##\n" \
        "..#.#.....\n" \
        "#L######L#\n" \
        "#.LL###L.L\n" \
        "#.#L###.##\n"
      )
    end
  end

  describe 'run_until_stable' do
    it 'runs for 5 rounds' do
      seat_simulator.run_until_stable
      expect(seat_simulator.instance_variable_get(:@round)).to eq(6)
    end

    it 'has 37 occupied seats' do
      seat_simulator.run_until_stable
      expect(seat_simulator.num_occupied_seats).to eq(37)
    end

    context 'when lenient is true' do
      it 'runs for 5 rounds' do
        seat_simulator.run_until_stable(lenient: true)
        expect(seat_simulator.instance_variable_get(:@round)).to eq(7)
      end

      it 'has 37 occupied seats' do
        seat_simulator.run_until_stable(lenient: true)
        expect(seat_simulator.num_occupied_seats).to eq(26)
      end
    end
  end
end
