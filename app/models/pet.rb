class Pet
  include Mongoid::Document
  field :name, type: String
  field :animal, type: String
  field :shelter, type: String

end
