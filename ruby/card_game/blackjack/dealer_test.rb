require_relative './dealer'
require 'minitest/autorun'

module Blackjack
  class DealerTest < Minitest::Test
    def setup
      @dealer = Dealer.new
    end

    def test_new_dealer_has_empty_hand
      assert @dealer.hand.empty?
    end

    def test_new_dealer_with_set_hand
      hand = CardGame::Hand.new
      dealer = Dealer.new(hand)
      assert_equal hand, dealer.hand
    end

    def test_add_to_hand_adds_cards_to_hand
      card1 = CardGame::Card.new(:hearts, :ace)
      card2 = CardGame::Card.new(:spades, :ace)
      @dealer.add_to_hand(card1, card2)

      assert_equal 2, @dealer.hand.size
    end
  end
end