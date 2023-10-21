class CardsController < ApplicationController

    before_action :set_card, only: [:show, :edit, :update]
    def index
        @cards = Card.paginate(page: params[:page], per_page: 5)
    end

    def show 
    
    end

    def new 
        @card = Card.new
    end

    def create 
        @card = Card.new(card_params)
        @card.user = current_user
        if @card.save 
            flash[:success]= "FlashCard criado com sucesso!"
            redirect_to card_path(@card)
        else 
            render 'new'
        end
    end

    def edit
        
    end
    def update
        
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

    def set_card 
        @card = Card.find(params[:id])
    end

    def card_params
        params.require(:card).permit(:word, :description, :points)
    end
end