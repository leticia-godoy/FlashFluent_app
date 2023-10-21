class SessionsController < ApplicationController


    def new

    end
    
    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Usuário logado com sucesso!"
            redirect_to user
        else
            flash.now[:danger] = "Algo deu errado com informações de login"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Deslogado com sucesso!"
        redirect_to root_path
    end
end