class AuditoriumMoviesController < ApplicationController
  def index
    @auditorium = Auditorium.find(params[:id])
    if params[:movie]
      ticket_cost_filter = params[:movie][:ticket_cost]
      @movies = @auditorium.movies.where("ticket_cost >= #{ticket_cost_filter}")
    else
      @movies = @auditorium.movies
    end
  end

  def new
    @auditorium = Auditorium.find(params[:id])
  end

  def create
    @auditorium = Auditorium.find(params[:id])
    movie = @auditorium.movies.new(movie_params)

    if movie.save
      redirect_to "/auditoriums/#{@auditorium.id}/movies"
    else
      flash[:notice] = 'Movie not created: Required information missing.'
      render :new
    end
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
