class MoviesController < ApplicationController
  def index
    # require "pry"; binding.pry
    @movies = Movie.where('is_rated_r = true')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])

    movie_params.each do |key, value|
      if !value.empty?
        movie.update!({:"#{key}" => value})
      end
    end

    redirect_to "/movies/#{movie.id}"
  end

  def new

  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to "/movies"
  end

  private

  def movie_params
    params.require(:movie).permit(:name,
                                  :showtime_date,
                                  :showtime_start,
                                  :duration,
                                  :ticket_cost,
                                  :is_rated_r)
  end
end
