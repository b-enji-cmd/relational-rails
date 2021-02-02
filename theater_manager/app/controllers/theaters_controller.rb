class TheatersController < ApplicationController

	def index
		@theaters = ['Theater 1', 'Theater 2','Theater 3']
	end
	
end