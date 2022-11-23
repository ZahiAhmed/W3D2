class Card
    VALUES = ("a".."z").to_a
    def self.shuffled_pairs(num_pairs)
        possible_values = VALUES.shuffle!

        cards = []
        
        num_pairs.times do
            pair_val = possible_values.pop
            card_1 = Card.new(pair_val)
            card_2 = Card.new(pair_val)
            cards << card_1 << card_2
        end
        cards.shuffle!
    end

    attr_reader :value
    
    def initialize(value)
        @value = value
        @face_up = false
    end

    def face_up?
        @face_up
    end

    def to_s
        @value = "#{@value}"
    end

    def flip
        if @face_up == false
            @face_up = true
        else
            @face_up = false
        end
    end

    def display
        if self.face_up?
            return @value.to_s.ljust(2)
        end
        "[]"
    end
end