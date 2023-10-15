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
            flash[:success]= "FlashCard criado com sucesso!"
            redirect_to card_path(@card)
        else 
            render 'new'
        end
    end

    def edit
        @card = Card.find(params[:id])
    end
    def update
        @card = Card.find(params[:id])
        if @card.update(card_params)
            flash[:success] = "FlashCard atualizado com sucesso!"
            redirect_to card_path(@card)
        else
            render 'edit'
        end
    end

    def destroy
        Card.find(params[:id]).destroy        
        flash[:success] = "FlashCard deletado com sucesso!"
        redirect_to cards_path
    end 


    private 

    def card_params
        params.require(:card).permit(:word, :description, :points)
    end
end