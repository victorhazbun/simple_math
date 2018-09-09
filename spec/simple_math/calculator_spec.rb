# frozen_string_literal: true
require 'byebug'
RSpec.describe SimpleMath::Calculator do
  context '.run' do
    context 'single operations' do
      it 'adds' do
        result = described_class.run(start: 1) { |h| h[:+][3] }
        expect(result).to eql(4.0)
      end

      it 'subtracts' do
        result = described_class.run(start: 0) { |h| h[:-][5] }
        expect(result).to eql(-5.0)
      end

      it 'multiplies' do
        result = described_class.run(start: 5) { |h| h[:*][4] }
        expect(result).to eql(20.0)
      end

      it 'divides' do
        result = described_class.run(start: 4) { |h| h[:/][3] }
        expect(result).to eql(1.3333333333333333)
      end

      it 'divides by zero' do
        result = described_class.run(start: 5) { |h| h[:/][0] }
        expect(result).to eql(Float::INFINITY)
      end
    end

    context 'multiple operations' do

      context 'run with +start+ argument example' do
        it 'resolves ((((5 + 3) - 2) * 4) / 2)' do
          result = described_class.run(start: 5) do |dc|
            dc[:+][3]
            dc[:-][2]
            dc[:*][4]
            dc[:/][2]
          end
          expect(result).to eql(12.0)
        end
      end

      context 'run without +start+ argument example' do
        it 'resolves ((((0 + 3) - 2) * 4) / 2)' do
          result = described_class.run do |dc|
            dc[:+][3]
            dc[:-][2]
            dc[:*][4]
            dc[:/][2]
          end
          expect(result).to eql(2.0)
        end
      end

      context 'iteration example' do
        let(:sample) { Struct.new(:operation, :number) }
        let(:samples) {
          [
            sample.new(:+, 3),
            sample.new(:-, 2),
            sample.new(:*, 4),
            sample.new(:/, 2)
          ]
        }

        it 'resolves ((((5 + 3) - 2) * 4) / 2)' do
          result = described_class.run(start: 5) do |dc|
            samples.each do |s|
              dc[s.operation][s.number]
            end
          end
          expect(result).to eql(12.0)
        end
      end
    end
  end
end
