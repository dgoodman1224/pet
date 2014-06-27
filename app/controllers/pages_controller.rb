class PagesController < ApplicationController
	
	def index
	end

	def create
	end

	def list
		@pets = Pets.get_pets(params["shelter"],params["count"])["petfinder"]["pets"]["pet"]
		@pet_array = Pets.parse(@pets)
		@pet_array.each {|pet| Pet.create(pet)}
		redirect_to '/pets'
	end
end