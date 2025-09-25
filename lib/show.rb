#Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.

class Show
  def board
  a2 = " "
  puts "   1   2   3 "
  puts "A #{a2}  | #{a2} | #{a2} "
  puts "  -----------"
  puts "B #{a2}  | #{a2} | #{a2} "
  puts "  -----------"
  puts "C #{a2}  | #{a2} | #{a2} "
  end
end