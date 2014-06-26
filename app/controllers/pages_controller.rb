class PagesController < ApplicationController
	def list

		@shelter = Pets.get_pets
		p @shelter
	end
end