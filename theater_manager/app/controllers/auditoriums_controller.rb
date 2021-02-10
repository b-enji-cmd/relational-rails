class AuditoriumsController < ApplicationController
  def index
    @auditoriums = Auditorium.order_created_at_desc
  end

  def new
  end

  def create
    auditorium = Auditorium.new(auditorium_params)

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

    auditorium_params.each do |key, value|
      if !value.empty?
        auditorium.update!({:"#{key}" => value})
      end
    end

    redirect_to "/auditoriums/#{auditorium.id}"
  end

  def destroy
		Auditorium.destroy(params[:id])
		redirect_to '/auditoriums'
  end

  private

  def auditorium_params
    params.require(:auditorium).permit(:name, :capacity, :is_imax_auditorium)
  end
end
