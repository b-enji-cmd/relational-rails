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
      is_imax_auditorium: params[:auditorium][:is_imax_auditorium] || false
      })

      if auditorium.save
        redirect_to '/auditoriums'
      else
        flash[:notice] = 'Auditorium not created: Required information missing.'
        render :new
      end
  end

  def show
    @auditorium = Auditorium.find(params[:id])
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    auditorium = Auditorium.find(params[:id])

    auditorium.update({
      name: params[:auditorium][:name],
      capacity: params[:auditorium][:capacity],
      is_imax_auditorium: params[:auditorium][:is_imax_auditorium]
      })

      auditorium.save

      redirect_to "/auditoriums/#{auditorium.id}"
  end

  def destroy
		Auditorium.destroy(params[:id])
		redirect_to '/auditoriums'
  end

  # private
  #
  # def auditorium_params
  #   params.require(:auditorium).permit(:name, :capacity, :is_imax_auditorium)
  # end
end
