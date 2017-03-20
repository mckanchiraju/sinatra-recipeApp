require 'dm-core'
require 'dm-migrations'


class Recipe
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :food_type, String
  property :ingredients, Text
  property :directions, Text
  property :cook_time, Integer
end
DataMapper.finalize
