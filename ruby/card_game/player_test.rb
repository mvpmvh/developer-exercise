require_relative './player'
require_relative './hand'
require_relative './card'
require 'minitest/autorun'

module CardGame
  class PlayerTest < Minitest::Test
    def setup
      @player = Player.new
    end

    def test_new_player_has_empty_hand
      assert @player.hand.empty?
    end

    def test_new_player_with_set_hand
      hand = Hand.new
      player = Player.new(hand)
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