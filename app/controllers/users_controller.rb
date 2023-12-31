class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_instructor, only: [:destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] =  @user.id
            flash[:success] = "Bem vindo(a) #{@user.username}, ao FlashFluent!"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user_cards = @user.cards.paginate(page: params[:page], per_page: 5)
        @user_liked_cards = @user.liked_cards.paginate(page: params[:page], per_page: 5)
    end

    def edit 
        
    end

    def update 
        if @user.update(user_params)
            flash[:success] = "Conta atualizada com sucesso!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy        
        flash[:success] = "Usuário deletado com sucesso!"
        redirect_to users_path
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email,:password,:password_confirmation)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:danger] = "Você só pode editar/deletar a sua conta"
            redirect_to users_path
        end
    end

    def require_instructor
        if logged_in? && !current_user.instructor?
            flash[:danger] = "Apenas instrutores podem realizar esta ação"
            redirect_to root_path
        end
    end
end