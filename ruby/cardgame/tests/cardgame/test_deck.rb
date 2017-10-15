require 'test_helper'

module CardGame
  class DeckTest < Minitest::Test
    def setup
      @deck = Deck.new
    end
    
    def test_new_deck_has_52_cards
      assert_equal @deck.cards.size, 52
    end

    def test_shuffled_deck_has_52_cards
      @deck.shuffle
      assert_equal @deck.cards.size, 52
    end
    
    def test_taken_card_does_not_remain_in_deck
      card = @deck.take.first
      refute @deck.cards.include?(card)
    end

    def test_taken_card_reduces_deck_size_by_taken_count
      @deck.take(10)
      assert_equal @deck.cards.size, 42
    end

    def test_take_defaults_to_single_card_taken
      @deck.take
      assert_equal @deck.cards.size, 51
    end

    def test_empty_true_for_empty_deck
      @deck.take(52)
      assert @deck.empty?
    end

    def test_empty_false_for_non_empty_deck
      refute @deck.empty?
    end

    def test_size_returns_correct_size
      assert_equal 52, @deck.size
    end

    def test_adding_another_deck_combines_all_cards
      second_deck = Deck.new
      combined_deck = @deck + second_deck

      assert_equal 104, combined_deck.cards.size
    end

    def test_adding_another_deck_leaves_original_decks_unchanged
      second_deck = Deck.new
      @deck + second_deck

      assert_equal 52, @deck.cards.size
      assert_equal 52, second_deck.cards.size
    end
  end
end