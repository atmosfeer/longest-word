class CountdownController < ApplicationController
  include CountdownHelper
  def play
    @grid = generate_grid(10)
    @start_time = Time.now
  end

  def score
    @attempt = params[:clueless]
    grid = params[:grid_string].chars
    start_time = Time.parse(params[:start_time])
    end_time = Time.now
    @result = run_game(@attempt, grid, start_time, end_time)
    update_session(@result)
    @high_score = session[:high_score]
  end

  private

  def update_session(result)
    if session[:high_score].nil? || session[:high_score] < result[:score]
      session[:high_score] = result[:score]
    end
  end
end
