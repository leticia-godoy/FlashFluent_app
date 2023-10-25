class TopicsController < ApplicationController

    before_action :set_topic, only: [:edit,:update,:show]
    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def show
        @topic_cards = @topic.cards.paginate(page: params[:page], per_page: 5)
    end

    def index
        @topics = Topic.paginate(page: params[:page], per_page: 5)
    end
    
    private

    def set_topic 
        @topic = Topic.find(params[:id])
    end
end