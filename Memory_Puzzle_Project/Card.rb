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

    def initialize(value, face_up=false)
        @value = value
        @face_up = face_up
    end

    def hide
        @face_up = false 
    end

    def reveal
        @face_up = true
    end

    def face_up
        @face_up
    end

    def to_s
        @value.to_s
    end

    def ==
        
    end
end