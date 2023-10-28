class ComentsController < ApplicationController

    before_action :require_user

    def create 
        @card = Card.find(params[:card_id])
        @coment = @card.coments.build(coment_params)
        @coment.user = current_user
        if @coment.save
            flash[:success] = "Comentário adicionado com sucesso!"
            redirect_to card_path(@card)
        else
            flash[:danger] = "Comentário não criado"
            redirect_back fallback_location: card_path(@card)
        end
    end 

    private

    def coment_params
        params.require(:coment).permit(:description)
    end
end