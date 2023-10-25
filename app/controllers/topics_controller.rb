class TopicsController < ApplicationController

    before_action :set_topic, only: [:edit,:update,:show]
    before_action :require_instructor, except: [:show, :index]

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new(topic_params)
        if @topic.save
            flash[:success] = "Tópico criado com sucesso!"
            redirect_to topic_path(@topic)
        else
            render 'new'
        end
    end

    def update
        if @topic.update(topic_params)
            flash[:success] = "Tópico atualizado com sucesso!"
            redirect_to @topic
        else
            render 'edit'
        end
    end

    def show
        @topic_cards = @topic.cards.paginate(page: params[:page], per_page: 5)
    end

    def index
        @topics = Topic.paginate(page: params[:page], per_page: 5)
    end
    
    private

    def topic_params
        params.require(:topic).permit(:name)
    end

    def set_topic 
        @topic = Topic.find(params[:id])
    end

    def require_instructor
        if !logged_in? || (logged_in? and !current_user.instructor?)
            flash[:danger] = "Apenas instrutores podem realizar esta ação"
            redirect_to topics_path
        end
    end
end