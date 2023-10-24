class Card < ApplicationRecord

    validates :word, presence: true
    validates :description, presence: true, length: {minimum:5, maximum:500}
    validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    belongs_to :user
    validates :user_id, presence: true
    default_scope -> { order(updated_at: :desc)}
    has_many :card_topics
    has_many :topics, through: :card_topics
    has_many :coments, dependent: :destroy
end