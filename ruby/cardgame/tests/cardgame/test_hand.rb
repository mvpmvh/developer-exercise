require 'test_helper'

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

    def test_equal_hands_true
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace) 
      hand1 = Hand.new(card1, card2)
      
      card3 = Card.new(:hearts, :ace)
      card4 = Card.new(:spades, :ace)
      hand2 = Hand.new(card3, card4)

      assert_equal hand1, hand2
    end

    def test_unequal_hands_false
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace) 
      hand1 = Hand.new(card1, card2)
      
      card3 = Card.new(:clubs, :ace)
      card4 = Card.new(:spades, :ace)
      hand2 = Hand.new(card3, card4)

      refute_equal hand1, hand2
    end
  end
end
