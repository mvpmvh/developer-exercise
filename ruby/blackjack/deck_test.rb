require_relative './deck'
require 'minitest/autorun'

class DeckTest < Minitest::Test
    def setup
      @deck = Deck.new
    end
    
    def test_new_deck_has_52_playable_cards
      assert_equal @deck.playable_cards.size, 52
    end
    
    def test_dealt_card_should_not_be_included_in_playable_cards
      card = @deck.deal_card
      refute @deck.playable_cards.include?(card)
    end

    def test_dealt_card_should_reduce_deck_size_by_one
      card = @deck.deal_card
      assert_equal @deck.playable_cards.size, 51
    end
  
    def test_shuffled_deck_has_52_playable_cards
      @deck.shuffle
      assert_equal @deck.playable_cards.size, 52
    end
  end