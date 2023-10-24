class CardTopic < ApplicationRecord
    belongs_to :topic
    belongs_to :card
end