class Player
  attr_accessor :hand, :name, :record, :money, :bet

  def initialize(name, money = nil)
    @name = name
    @hand = []
    @money = money
    @record = { 'wins' => 0, 'losses' => 0, 'ties' => 0 }
    @bet = 0
  end

  def score
    hand_score = 0
    @hand.each do |card|
      if card.rank != 'A'
        hand_score += card.value
      elsif (hand_score) > 10
        hand_score += 1
      else
        hand_score += 11
      end
    end
    hand_score
  end

  def last_card
    puts "The #{@name} was dealt a #{@hand.last.face}"
  end

  def score_status
    puts "The #{@name}'s current score is #{score}."
  end

  def record_result(result)
    @record[result] += 1
  end

  def display_score
    puts "Wins: #{@record['wins']} Losses: #{@record['losses']} Pushes: #{@record['ties']}"
    puts "Current Bank Account: $#{@money}"
    if @money <= -1000
        puts "Your other hand is broken!"
        puts "Total broken limbs: 2 hands and 2 legs."
        puts "Now you can't ever play blackjack. Sorry."
        exit
      elsif @money <= -800
        puts "Your dominant hand is broken!"
        puts "Limbs broken by collector: 1 hands and 2 legs."
      elsif @money <= -600
        puts "Your other leg is broken!"
        puts "Limbs broken by collector: 2 legs."
      elsif @money <= -400
        puts "One of your legs is broken!"
        puts "Limbs broken by collector: 1 leg."
      elsif @money <= -200
        puts "Be careful! You're starting to collect a lot of debt."
        puts "The debt collector will start breaking you limbs if you don't start winning soon!"
      end
  end

  def bet_money(gamble)
    @bet = gamble
    @money -= @bet
  end

  def win_money
    @money += @bet * 2
  end

  def push_money
    @money += @bet
  end

  def win_money_blackjack
    @money += @bet * 2.5
    @money.to_i
  end
end
