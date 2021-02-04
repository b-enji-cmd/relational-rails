class AuditoriumsController < ApplicationController
  def index
    @auditoriums = Auditorium.all
  end

  def new
  end

  def create
    auditorium = Auditorium.new({
      name: params[:auditorium][:name],
      capacity: params[:auditorium][:capacity],
      is_imax_auditorium: params[:auditorium][:is_imax_auditorium]
      })

      auditorium.save

      redirect_to '/auditoriums'
  end

  def show
    @auditorium = Auditorium.find(params[:id])
  end
end
