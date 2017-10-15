require './blackjack'
require 'minitest/autorun'

class BlackJackTest < Minitest::Test
    def setup
      @game = Blackjack.new
    end

    def test_negative_player_count_raises_argument_error
      err = assert_raises ArgumentError do 
        Blackjack.new(-1)
      end
          
      assert_equal "Players must be an integer between 1 and 6", err.message
    end

    def test_float_player_count_raises_argument_error
      err = assert_raises ArgumentError do
        Blackjack.new(2.5)
      end

      assert_equal "Players must be an integer between 1 and 6", err.message  
    end

    def test_large_player_count_raises_argument_error
      err = assert_raises ArgumentError do
        Blackjack.new(7)
      end
    
      assert_equal "Players must be an integer between 1 and 6", err.message  
    end

    def test_negative_deck_count_raises_argument_error
        err = assert_raises ArgumentError do 
          Blackjack.new(1,-1)
        end
            
        assert_equal "Decks must be an integer between 1 and 8", err.message  
      end
  
      def test_float_deck_count_raises_argument_error
        err = assert_raises ArgumentError do
          Blackjack.new(1, 2.5)
        end
  
        assert_equal "Decks must be an integer between 1 and 8", err.message  
      end

      def test_large_deck_count_raises_argument_error
        err = assert_raises ArgumentError do
          Blackjack.new(1,10)
        end
      
        assert_equal "Decks must be an integer between 1 and 8", err.message  
      end

      def test_default_blackjack_game_has_1_player
        assert_equal 1, @game.players
      end

      def test_default_blackjack_game_has_1_deck
        assert_equal 1, @game.dealer.decks
      end
end