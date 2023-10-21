class PagesController < ApplicationController

    def home
        redirect_to cards_path if logged_in?
    end

end