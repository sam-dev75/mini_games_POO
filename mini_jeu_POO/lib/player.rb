require 'pry'

class Player
  attr_accessor :name ,:life_points

  def initialize (player_name)
    @name = player_name
    @life_points = 10

  end

  #puts "Here is the state of our players :" 

  def show_state
    puts "#{@name} has #{@life_points} life points" 
  end
  
  #puts "Passons à la phase des domages :"

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points >= 0 
      puts "#{@name} has lost #{damage_received} points"
      else
        puts "player #{@name} has been killed !! RIP amigo" 
    end
    show_state

  end

  #puts "Passons à la phase d'attaque :"

  def attacks(attacked_player)
    puts "\n\n#{@name} turn\n\n"
    puts "#{@name} attack #{attacked_player.name}"
    damage_received = compute_damage
    puts "#{@name} inflicts #{damage_received} points of damage to #{attacked_player.name}"
    attacked_player.gets_damage(damage_received)
  end

  def compute_damage
     return rand(1..6)
  end

end  

#puts "class_2 : HumanPlayer"

class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name)
    @weapon_level = 1 # j'ai rajouté cette ligne
    super(name)
    @life_points = 100 # fait appel au initialize de la classe Player
  end

  def show_state
    if @life_points > 0
      puts "\n\nYou have #{@life_points} life points left and your weapon level is #{weapon_level}.\n\n\n\n"
    else @life_points = 0
      puts "\n\nYou have 0 life points left\n\n"
      puts "You are dead!\n\n"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "\n\nYou found a level #{dice} weapon"
    if dice > @weapon_level
      @weapon_level = dice
      puts 'Yeah! This one is more powerful than your current weapon, you take it!'
    else
      puts "Motherf@*#{$INPUT_LINE_NUMBER}.. This one is less powerful than your current weapon... "
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "\n\nYou found nothing..."
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      puts "\n\nWell done! you found a pack of +50 hv"
    else
      @life_points += 80
      puts "\n\nWell done! you found a pack of +80 hv"
    end
    @life_points = 100 if @life_points > 100
    puts "Your life is now of #{@life_points}"
  end
end


puts "end of player"

