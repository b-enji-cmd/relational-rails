class AuditoriumMoviesController < ApplicationController
  def index
    @auditorium = Auditorium.find(params[:id])
    @movies = @auditorium.movies
  end

  def new
    @auditorium = Auditorium.find(params[:id])
  end

  def create
    @auditorium = Auditorium.find(params[:id])
    movie = Movie.new({ name: params[:movie][:name],
                      showtime_date: params[:movie][:showtime_date],
                      showtime_start: params[:movie][:showtime_start],
                      duration: params[:movie][:duration],
                      ticket_cost: params[:movie][:ticket_cost],
                      is_rated_r: params[:movie][:is_rated_r],
                      auditorium_id: params[:movie][:auditorium_id]})


      if movie.save
        redirect_to "/auditoriums/#{@auditorium.id}/movies"
      else
        flash[:notice] = 'Movie not created: Required information missing.'
        render :new
      end
  end
end
