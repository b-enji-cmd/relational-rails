class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])

    params[:movie].each do |key, value|
      if !value.empty? && key != "auditorium_id"
        movie.update!({:"#{key}" => value})
      end
    end

    redirect_to "/movies/#{movie.id}"
  end
end
