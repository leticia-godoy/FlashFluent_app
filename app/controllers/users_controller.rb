class UsersController < ApplicationController

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Bem vindo(a) #{@user.username}, ao FlashFluent!"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show 
        @user = User.find(params[:id])
        @user_cards = @user.cards.paginate(page: params[:page], per_page: 5)
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Conta atualizada com sucesso!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user =  User.find(params[:id])
        @user.destroy        
        flash[:success] = "Usuário deletado com sucesso!"
        redirect_to users_path
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email,:password,:password_confirmation)
    end
end