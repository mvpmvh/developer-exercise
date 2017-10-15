require_relative './hand'
require_relative './card'
require 'minitest/autorun'

module CardGame
  class HandTest < Minitest::Test
    def setup
      @hand = Hand.new
    end

    def test_new_hand_is_empty_by_default
      assert_empty @hand.cards
    end

    def test_empty_true_for_empty_hand
      assert @hand.empty?
    end

    def test_empty_false_for_non_empty_hand
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace) 
      hand = Hand.new(card1, card2)

      refute hand.empty?
    end

    def test_size_matches_number_of_cards_in_hand
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace) 
      hand = Hand.new(card1, card2)

      assert_equal 2, hand.size
    end

    def test_add_cards_adds_cards_to_hand
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace) 
      @hand.add_cards(card1, card2)

      assert_equal 2, @hand.size
    end
  end
end
