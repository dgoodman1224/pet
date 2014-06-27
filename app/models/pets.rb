class Pets
	include Mongoid::Document
	
	field :name, type: String
	
	public
	
		def self.get_pets(shelter_id, count)
		# petfinder = Petfinder::Client.new('f77a4c7581f1896f99d6e4764a7cffe6', "62c7a478061f92f227a0425e56748f2")
		# petfinder.shelter('CA123').getPets
	# 	test_url = "http://api.petfinder.com/shelter.getPets?key=f77a4c7581f1896f99d6e4764a7cffe6&id=KY
	# 413&count=25&format=json"
		response = HTTParty.get(URI.encode("http://api.petfinder.com/shelter.getPets?key=f77a4c7581f1896f99d6e4764a7cffe6&id=#{shelter_id}&count=#{count}&format=json"))
		end

		def self.parse(pets)
			pets.map do |pet|
				{name: pet["name"]["$t"], shelter: pet["shelterId"]["$t"], animal: pet["animal"]["$t"]}
			end
		end
end

# puts response.body, response.code, response.message, response.headers.inspect

# # Or wrap things up in your own class
# class StackExchange
#   include HTTParty
#   base_uri 'api.stackexchange.com'

#   def initialize(service, page)
#     @options = { query: {site: service, page: page} }
#   end

#   def questions
#     self.class.get("/2.2/questions", @options)
#   end

#   def users
#     self.class.get("/2.2/users", @options)
#   end
# end

# stack_exchange = StackExchange.new("stackoverflow", 1)
# puts stack_exchange.questions
# puts stack_exchange.users
#   end

# end