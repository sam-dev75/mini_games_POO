require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "=========================================================================="
puts "
███████╗██╗ ██████╗ ██╗  ██╗████████╗     ██████╗██╗     ██╗   ██╗██████╗ 
██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝    ██╔════╝██║     ██║   ██║██╔══██╗
█████╗  ██║██║  ███╗███████║   ██║       ██║     ██║     ██║   ██║██████╔╝
██╔══╝  ██║██║   ██║██╔══██║   ██║       ██║     ██║     ██║   ██║██╔══██╗
██║     ██║╚██████╔╝██║  ██║   ██║       ╚██████╗███████╗╚██████╔╝██████╔╝
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═════╝╚══════╝ ╚═════╝ ╚═════╝ 
"
puts "==========================================================================\n\n"


player1 = Player.new("Josiane")
player2 = Player.new("José")


puts "--------------------------------------------------------------------------\n\n"

puts "Please welcome #{player1.name} and #{player2.name}!\n\n"


while player1.life_points > 0 && player2.life_points >0 do

  puts "Here is the state of our players:" #puts "Voici l'état de chaque joueur :"

  player1.show_state  
  player2.show_state  

  puts "--------------------------------------------------------------------------\n\n"

  puts "Let's Fight!!\n\n" #puts "Passons à la phase d'attaque :"

  puts "--------------------------------------------------------------------------\n\n"

  player1.attacks(player2) #Josiane attacks José

  if player2.life_points <= 0 
    break 
  end


end

binding.pry 

puts "end of play and thank's, ;) smile "