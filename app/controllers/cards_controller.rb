class CardsController < ApplicationController

    before_action :set_card, only: [:show, :edit, :update, :destroy, :like]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_instructor, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_user_like, only: [:like]

    def index
        @cards = Card.paginate(page: params[:page], per_page: 5)
    end

    def show 
        @coment = Coment.new
        @coments = @card.coments.paginate(page: params[:page], per_page: 5)
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
            format.turbo_stream { render :edit }
        end
    end

    def destroy
        Card.find(params[:id]).destroy        
        flash[:success] = "FlashCard deletado com sucesso!"
        redirect_to cards_path
    end 

    def like
        if @card.liked_by?(current_user)
            like = Like.find_by(user: current_user, card: @card)
            like.destroy
            flash[:success] = "Card removido dos seus favoritos!"
        else
            like = Like.create(like: params[:like], user: current_user, card: @card)
            flash[:success] = "Card adicionado aos seus favoritos!"
        end
            redirect_back(fallback_location: root_path)
    end


    private 

    def set_card 
        @card = Card.find(params[:id])
    end

    def card_params
        params.require(:card).permit(:word, :description, :points, topic_ids: [])
    end

    def require_same_user
        if current_user != @card.user
            flash[:danger] = "Você só pode editar/deletar os seus flashCards"
            redirect_to cards_path
        end
    end

    def require_instructor
        unless current_user.instructor?
            flash[:danger] = "Apenas instrutores podem criar ou editar flashcards."
            redirect_to cards_path
        end
    end

    def require_user_like
        if !logged_in?
            flash[:danger] = "Você deve estar logado para adicionar o card aos favoritos"
            redirect_back(fallback_location: root_path)
        end
    end
end