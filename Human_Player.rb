
class HumanPlayer

    def get_input
        p "put two numbers"
        gets.chomp.split.map {|ele| ele.to_i}
    end

end