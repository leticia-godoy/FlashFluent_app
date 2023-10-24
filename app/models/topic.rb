class Topic < ApplicationRecord
    validates :name, presence: true, length: { minimun: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :card_topics
    has_many :cards, through: :card_topics
end