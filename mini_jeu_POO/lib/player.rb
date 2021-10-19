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




puts "end of player"

