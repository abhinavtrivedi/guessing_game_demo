class GameController < ApplicationController
  def index
  end

  def new
    game = Game.new
    session[:current_game] = game
    redirect_to :index
  end

  def guess
    game = session[:current_game]
    if game == nil
      flash[:warning] = 'No saved game found. Starting over.'
    else
      game.guess = params['game']['guess']
      flash.now[:notice] = "User:[#{game.guess}] Correct:[#{game.secret}]"
      session[:current_game] = game
    end
    redirect_to :index
  end
end
