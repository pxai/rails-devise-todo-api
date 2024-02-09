class RestrictedController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: {msg: 'ok, welcome to restricted'}
    end 
end