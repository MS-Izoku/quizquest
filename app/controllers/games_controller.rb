class GamesController < ApplicationController
    def index
        @games = Game.all
    end

     def show	    	        @game = Game.find_by(id: params[:id])
    end

     def new
        Game.new
    end
    def create
        # @category = Category.find_by(id: params[:category_id]).questions
        p params
        @questions = Question.find_by(category_id: params[:category_id])

         @game = Game.create
        redirect_to game_path(@game.id)
    end

     private

     def game_params
        params.require(:category).require(:category_id)
        # params.require(:game).require(:game_id, :game_key)
    end	    
end	