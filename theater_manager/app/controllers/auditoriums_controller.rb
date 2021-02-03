class AuditoriumsController < ApplicationController
  def index
    @auditoriums = ['Auditorium1', 'Auditorium2']
    # @auditoriums = Auditorium.all
  end

  def new
  end

  def create
    auditorium = Auditorium.new({
      name: params[:auditorium][:name],
      capacity: params[:auditorium][:capacity],
      is_imax_theater?: params[:auditorium][:is_imax_theater?]
      })
      binding.pry

      auditorium.save

      redirect_to '/auditoriums'
  end
end
