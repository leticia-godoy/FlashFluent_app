class ApplicationController < ActionController::Base

    def hello
        render plain: "opa!"
    end
end
