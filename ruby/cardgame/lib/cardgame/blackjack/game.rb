module Blackjack
  class Game
    attr_reader :players, :dealer, :winners

    def initialize(total_players = 1, total_decks = 1)
      valid_players = total_players.is_a?(Integer) && (1..6).include?(total_players)
      raise ArgumentError, "Players must be an integer between 1 and 6" unless valid_players

      valid_decks = total_decks.is_a?(Integer) && (1..8).include?(total_decks)
      raise ArgumentError, "Decks must be an integer between 1 and 8" unless valid_decks

      @dealer = Dealer.new(total_decks)
      @winners = []
      setup_players(total_players)
    end

    def play
      # dealer deals 2 cards to each player
      @players.each { |player| player.add_to_hand(@dealer.deal(2)) }
      
      # dealer deals 2 cards to self
      @dealer.add_to_hand(@dealer.deal(2))
      
      # dealer exposes 1 of his cards to all players
      exposed_dealer_card = @dealer.hand.cards.first
      
      # TODO: implement player betting logic here...

      # if dealer is showing 10 - A
      if dealer_blackjack_possible?(exposed_dealer_card)
        @winners << dealer if @dealer.has_blackjack?
      else
        # players normally hit until blackjack, hit until 21, hit until bust, or stay
        @players.each { |player| player.play_hand(exposed_dealer_card) }
        
        if all_players_bust?
          @winners << @dealer
        else
          # dealer hits until at least 17
          @dealer.play_hand
          potential_winners = @players.reject { |player| player.busts? }

          if @dealer.busts?
            @winners = potential_winners
          else
            # if player scores > dealer && player score <= 21, player wins
            @winners << potential_winners.find_all { |player| player.blackjack_value > @dealer.blackjack_value }
            @winners << dealer if winners.empty?
          end
        end
      end
    end

    private

    def setup_players(total_players)
      @players = []
      total_players.times { |i| @players << Player.new(i, Blackjack::Strategies::Naive.new) }
    end

    # blackjack occurs when a 10-valued card is paired with an Ace
    # check the dealer's exposed card to see if blackjack is possible
    # this will affect how the dealer plays
    def dealer_blackjack_possible?(exposed_dealer_card)
      [
        Card::NAME_VALUES[:ten], 
        Card::NAME_VALUES[:jack], 
        Card::NAME_VALUES[:queen], 
        Card::NAME_VALUES[:king],
        Card::NAME_VALUES[:ace]
      ].include? exposed_dealer_card.name
    end

    def all_players_bust?
      @players.all? { |player|  player.busts? }
    end
  end
end