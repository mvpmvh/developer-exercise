require_relative './card'
require 'minitest/autorun'
module CardGame
  class CardTest < Minitest::Test
      def setup
        @card = Card.new(:hearts, :ten)
      end
      
      def test_unknown_suit_raises_error
        err = assert_raises ArgumentError do 
          Card.new(:fake, :ten)
        end
        
        assert_equal "Unknown suit 'fake'", err.message  
      end

      def test_unknown_name_raises_error
        err = assert_raises ArgumentError do
          Card.new(:spades, :foo)
        end

        assert_equal "Unknown name 'foo'", err.message
      end

      def test_card_suit_is_correct
        assert_equal @card.suit, :hearts
      end
    
      def test_card_name_is_correct
        assert_equal @card.name, :ten
      end
    
      def test_card_value_is_correct
        assert_equal @card.value, 10
      end
    end
  end