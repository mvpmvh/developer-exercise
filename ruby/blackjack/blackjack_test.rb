require './blackjack'
require 'minitest/autorun'

class BlackJackTest < Minitest::Test
    def setup
      @deck = Blackjack.new
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
end