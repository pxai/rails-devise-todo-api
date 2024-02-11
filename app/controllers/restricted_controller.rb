class RestrictedController < ApplicationController
    include CheckToken
    prepend_before_action :check_token
    def index
        render json: {msg: 'ok, welcome to restricted'}
    end
end