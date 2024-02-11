class HomeController < ApplicationController
    def index
        render json: {msg: 'ok home'}
    end

    def data
        render json: [
            {id: 1, name: 'Finish API', completed: true},
            {id: 2, name: 'Read Books', completed: false},
            {id: 3, name: 'Do exercise', completed: true},
        ]
    end

    def show
        puts "show #{params[:id]}"
        render json: [
            {id: 1, name: 'Finish API', completed: true},
            {id: 2, name: 'Read Books', completed: false},
            {id: 3, name: 'Do exercise', completed: true},
        ][params[:id].to_i - 1]
    end
end