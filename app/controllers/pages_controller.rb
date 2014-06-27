class PagesController < ApplicationController
	
	def index
	end

	def create
	end

	def list
		@pets = Pets.get_pets(params["shelter"],params["count"])["petfinder"]["pets"]["pet"]
		create_all(@pets)
	end
end