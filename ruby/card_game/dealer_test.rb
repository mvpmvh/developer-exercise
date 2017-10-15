require_relative './dealer'
require 'minitest/autorun'

module CardGame
  class DealerTest < Minitest::Test
    def setup
      @dealer = Dealer.new
    end

    def test_dealer_raises_error_if_negative_deck_count
      err = assert_raises ArgumentError do 
        Dealer.new(-1)
      end
                
      assert_equal "Dealer needs at least 1 deck", err.message  
    end

    def test_dealer_raises_error_if_zero_deck_count
      err = assert_raises ArgumentError do 
        Dealer.new(0)
      end
                    
      assert_equal "Dealer needs at least 1 deck", err.message  
    end

    def test_dealer_defaults_to_single_deck                
      assert_equal 52, @dealer.deck.size
    end

    def test_deal_raises_error_when_out_of_cards
      assert_raises OutOfCardsError do 
        deck = @dealer.deal!(53)
      end
    end

    def test_deal_returns_requested_number_of_cards
      cards = @dealer.deal!(2)
      assert_equal 2, cards.size
    end
  end
end