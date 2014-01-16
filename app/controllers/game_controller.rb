class GameController < ApplicationController
  def index
  end

  def new
    game = Game.new
    session[:current_game] = game
    redirect_to game_index_path
  end

  def guess
    game = session[:current_game]
    if game == nil
      flash[:warning] = 'No saved game found. Starting over.'
    else
      game.guess = params['game']['guess']
      if(!is_guess_valid?(game.guess))
        flash[:warning] = 'Invalid Guess. Must be a number between 1 and 20'
        redirect_to game_index_path and return
      end

      if(game.no_of_tries >= 5)
        flash[:warning] = 'Sorry. Number of tries finished.'
        redirect_to game_index_path and return
      end
      game.no_of_tries += 1
      #flash[:info] = "User:[#{game.guess}] Correct:[#{game.secret}]" # Testing
      session[:current_game] = game

    end
    redirect_to game_index_path
  end

  private
  def is_guess_valid?(user_string)
    (1..20).include?(Integer(user_string)) rescue false
  end
end
