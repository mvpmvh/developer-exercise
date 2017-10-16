require 'test_helper'

module Blackjack
  class TestGame < Minitest::Test
    def setup
      @game = Game.new
    end

    def test_negative_player_count_raises_argument_error
      err = assert_raises ArgumentError do 
        Game.new(-1)
      end
          
      assert_equal "Players must be an integer between 1 and 6", err.message
    end

    def test_float_player_count_raises_argument_error
      err = assert_raises ArgumentError do
        Game.new(2.5)
      end

      assert_equal "Players must be an integer between 1 and 6", err.message  
    end

    def test_large_player_count_raises_argument_error
      err = assert_raises ArgumentError do
        Game.new(7)
      end
    
      assert_equal "Players must be an integer between 1 and 6", err.message  
    end

    def test_negative_deck_count_raises_argument_error
      err = assert_raises ArgumentError do 
        Game.new(1,-1)
      end
            
      assert_equal "Decks must be an integer between 1 and 8", err.message  
    end
  
    def test_float_deck_count_raises_argument_error
      err = assert_raises ArgumentError do
        Game.new(1, 2.5)
      end
  
      assert_equal "Decks must be an integer between 1 and 8", err.message  
    end

    def test_large_deck_count_raises_argument_error
      err = assert_raises ArgumentError do
        Game.new(1,10)
      end
      
      assert_equal "Decks must be an integer between 1 and 8", err.message  
    end

    def test_default_blackjack_game_has_1_player
      assert_equal 1, @game.players.size
    end

    def test_default_blackjack_game_has_1_deck
      assert_equal 52, @game.dealer.deck.cards.size
    end

    def test_new_game_has_no_winners_yet
      assert_empty @game.winners
    end

    def test_play_game_always_has_at_least_one_winner
      @game.play!
      
      refute_empty @game.winners
    end

    def test_player_wins_game_when_blackjack_and_dealer_has_no_blackjack
      p1 = @game.players.first
      dealer = @game.dealer

      p1.stub :has_blackjack?, true do
        p1.stub :busts?, false do
          dealer.stub :has_blackjack?, false do
            @game.play!
            assert_equal 1, @game.winners.size
            assert_equal p1.name, @game.winners.first.name
          end
        end
      end
    end

    def test_player_wins_game_when_score_higher_than_dealer
      p1 = @game.players.first
      dealer = @game.dealer

      p1.stub :hand_value, 18 do
        dealer.stub :hand_value, 17 do
          @game.play!
          assert_equal 1, @game.winners.size
          assert_equal p1.name, @game.winners.first.name
        end
      end
    end

    def test_dealer_wins_game_when_all_players_bust
      p1 = @game.players.first

      p1.stub :busts?, true do
        @game.play!
        assert_equal 1, @game.winners.size
        assert_equal @game.dealer, @game.winners.first
      end
    end

    def test_dealer_wins_game_when_has_blackjack
      dealer = @game.dealer
      dealer.stub :exposed_card, CardGame::Card.new(:spades, :ace) do
        dealer.stub :has_blackjack?, true do
          @game.play!
          assert_equal 1, @game.winners.size
          assert_equal dealer.to_s, @game.winners.first.to_s
        end
      end
    end

    def test_dealer_wins_game_when_score_higher_than_players
      p1 = @game.players.first
      dealer = @game.dealer

      p1.stub :hand_value, 17 do
        dealer.stub :hand_value, 18 do
          @game.play!
          assert_equal 1, @game.winners.size
          assert_equal dealer.to_s, @game.winners.first.to_s
        end
      end
    end

    def test_dealer_wins_game_when_score_is_tied_with_players
      p1 = @game.players.first
      dealer = @game.dealer

      p1.stub :hand_value, 21 do
        dealer.stub :hand_value, 21 do
          @game.play!
          assert_equal 1, @game.winners.size
          assert_equal dealer.to_s, @game.winners.first.to_s
        end
      end
    end
  end
end