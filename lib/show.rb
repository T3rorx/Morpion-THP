#Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.

class Show
  def show
    puts "   1   2   3 "
    puts "A #{A1.value}  | #{A2.value} | #{A3.value} "
    puts "  -----------"
    puts "A #{B1.value}  | #{B2.value} | #{B3.value} "
    puts "  -----------"
    puts "A #{C1.value}  | #{C2.value} | #{C3.value} "
  end
end