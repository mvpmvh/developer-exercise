require 'test_helper'

module CardGame
  class PlayerTest < Minitest::Test
    def setup
      @player = Player.new("test player")
    end

    def test_new_player_has_empty_hand
      assert @player.hand.empty?
    end

    def test_new_player_with_set_hand
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace)
      hand = Hand.new(card1, card2)
      player = Player.new("test player", hand)
      
      assert_equal hand, player.hand
    end

    def test_add_to_hand_adds_cards_to_hand
      card1 = Card.new(:hearts, :ace)
      card2 = Card.new(:spades, :ace)
      @player.add_to_hand(card1, card2)

      assert_equal 2, @player.hand.size
    end
  end
end 