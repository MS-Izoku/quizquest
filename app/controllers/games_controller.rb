class GamesController < ApplicationController
    def index
        @games = Game.all
        @category = Category.find_by(id: params[:id])
    end


    def show
       @game = Game.find_by(id: params[:id])
       @category = Category.find_by(id: params[:id])
       @current_user = User.find_by(id: session[:user_id])
    end

    def lobby
      @username = params[:username]
    end

    def new
      Game.new
    end

    def create

      if params["Create"] == "Start Game"
        @questions = Question.find_by(category_id: params[:category_id])
        @game = Game.create(user_id: session[:user_id], category_id: game_params)
        redirect_to game_path(@game.id)
      elsif params["Create"] == "Create Game"
        redirect_to new_game_path
      end

    end

     private

     def game_params
        params.require(:category).permit(:category_id)
    end
end
