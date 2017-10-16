module Blackjack
  class Game
    attr_reader :players, :dealer, :winners, :exposed_dealer_card

    def initialize(total_players = 1, total_decks = 1)
      valid_players = total_players.is_a?(Integer) && (1..6).include?(total_players)
      raise ArgumentError, "Players must be an integer between 1 and 6" unless valid_players

      valid_decks = total_decks.is_a?(Integer) && (1..8).include?(total_decks)
      raise ArgumentError, "Decks must be an integer between 1 and 8" unless valid_decks

      @dealer = Dealer.new(total_decks)
      @winners = []
      setup_players(total_players)
    end

    def play!
      @winners = []
      @dealer.shuffle
      deal_to_players!
      deal_to_dealer!
      @dealer.expose_card

      # TODO: implement player betting logic here...

      # if dealer is showing 10 - A
      if dealer_blackjack_possible?(@dealer.exposed_card)
        @winners << @dealer if @dealer.has_blackjack?
        return
      end
      
      # players normally hit until blackjack, hit until 21, hit until bust, or stay
      @players.each { |player| player.play_hand!(@dealer) }
        
      @winners = @players.find_all { |player| player.has_blackjack? }
      return unless @winners.empty?
        
      if all_players_bust?
        @winners << @dealer
        return
      end

      # dealer hits until at least 17
      @dealer.play_hand!
      @winners = @players.reject { |player| player.busts? }
      return if @dealer.busts?
      
      # if player scores > dealer && player score <= 21, player wins
      @winners = @winners.find_all { |player| player.hand_value > @dealer.hand_value }
      @winners << dealer if @winners.empty?
    end

    private

    def setup_players(total_players)
      @players = []
      total_players.times { |i| @players << Player.new(i, Blackjack::Strategies::Naive) }
    end

    def deal_to_players!
      @players.each do |player|
        cards = @dealer.deal!(2) 
        player.add_to_hand(*cards)
      end
    end

    def deal_to_dealer!
      cards = @dealer.deal!(2)
      @dealer.add_to_hand(*cards)
    end

    # blackjack occurs when a 10-valued card is paired with an Ace
    # check the dealer's exposed card to see if blackjack is possible
    # this will affect how the dealer plays
    def dealer_blackjack_possible?(exposed_dealer_card)
      [
        CardGame::Card::NAME_VALUES[:ten], 
        CardGame::Card::NAME_VALUES[:jack], 
        CardGame::Card::NAME_VALUES[:queen], 
        CardGame::Card::NAME_VALUES[:king],
        CardGame::Card::NAME_VALUES[:ace]
      ].include?(exposed_dealer_card.name)
    end

    def all_players_bust?
      @players.all? { |player|  player.busts? }
    end
  end
end