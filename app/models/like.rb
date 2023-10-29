class Like < ApplicationRecord 

    belongs_to :user
    belongs_to :card

    validates_uniqueness_of :user, scope: :card
end