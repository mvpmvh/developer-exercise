require 'test_helper'

module Blackjack
  module Strategies
    class TestNaive < Minitest::Test
      def setup
        @strategy = Strategies::Naive
      end

      def self.play(hand_value, dealer_exposed_card)
        return :stay if hand_value > 15
        return :stay unless CardGame::Card::NAME_VALUES.keys.include?(dealer_exposed_card)
        :hit
      end
    
      def test_naive_strategy_stays_when_hand_value_greater_than_15
        (16..21).each do |value|
          assert_equal :stay, @strategy.play(value, CardGame::Card.new(:hearts, :ten))
        end
      end

      def test_naive_strategy_hits_when_hand_value_less_than_16
        (1..15).each do |value|
          assert_equal :hit, @strategy.play(value, CardGame::Card.new(:hearts, :ten))
        end
      end
    end
  end
end
  