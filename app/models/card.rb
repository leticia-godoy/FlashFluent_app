class Card < ApplicationRecord

    validates :word, presence: true
    validates :description, presence: true, length: {minimum:5, maximum:500}
    validates :points, presence: true
end