class CardsController < ApplicationController

    def index
        @cards = Card.all
    end

    def show 
        @card = Card.find(params[:id])
    end

    def new 
        @card = Card.new
    end

    def create 
        @card = Card.new(card_params)
        @card.user = User.last
        if @card.save 
            flash[:success]= "FlashCard criado!"
            redirect_to card_path(@card)
        else 
            render 'new'
        end
    end

    private 

        def card_params
            params.require(:card).permit(:word, :description, :points)
        end
end