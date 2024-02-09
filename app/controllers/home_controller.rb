class HomeController < ApplicationController
    def index
        render json: {msg: 'ok home'}
    end
end