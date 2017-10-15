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

    def test_has_blackjack_true_when_player_has_blackjack
      card1 = CardGame::Card.new(:hearts, :ace)
      card2 = CardGame::Card.new(:hearts, :ten)
      @dealer.add_to_hand(card1, card2)
      
      assert @dealer.has_blackjack?
    end

    def test_has_blackjack_false_when_player_does_not_have_blackjack
      card1 = CardGame::Card.new(:hearts, :king)
      card2 = CardGame::Card.new(:hearts, :ten)
      @dealer.add_to_hand(card1, card2)
      
      refute @dealer.has_blackjack?
    end

    def test_21_is_not_blackjack
      card1 = CardGame::Card.new(:hearts, :four)
      card2 = CardGame::Card.new(:hearts, :ten)
      card3 = CardGame::Card.new(:hearts, :seven)
      @dealer.add_to_hand(card1, card2, card3)
      
      refute @dealer.has_blackjack?
    end
  end
end