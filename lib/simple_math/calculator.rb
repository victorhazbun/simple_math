# frozen_string_literal: true

module SimpleMath
  # Calculator
  class Calculator
    attr_accessor :start

    def self.run(start: 0, &block)
      new(start: start).send(:calculate, &block)
    end

    private

    def initialize(start:)
      @start = start
    end

    def calculate
      operations_hash = operations(start)
      yield operations_hash if block_given?
      operations_hash[:total].call
    end

    def operations(total)
      {
        total: -> { total },
        '+': ->(number) { total += number.to_f }.curry,
        '-': ->(number) { total -= number.to_f }.curry,
        '*': ->(number) { total *= number.to_f }.curry,
        '/': ->(number) { total /= number.to_f }.curry
      }
    end
  end
end
