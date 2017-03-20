require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require './recipe.rb'
require 'json'

get '/' do
  @recipes = Recipe.all
  erb :home
end

get '/api/recipes' do
  @index = 0
  @recipes = Recipe.all
  erb :recipeApiLayout, layout: false
end

get '/api/recipes/:id' do
  content_type :json
  @recipe = Recipe.get(params[:id])
  rec = {id: @recipe.id, name: @recipe.name, food_type: @recipe.food_type, ingredients: @recipe.ingredients, directions: @recipe.directions, cook_time: @recipe.cook_time}
  rec.to_json
end

post '/recipes/create' do
  Recipe.create(name: params[:name].to_s, food_type: params[:food_type].to_s, ingredients: params[:ingredients].to_s, directions: params[:directions].to_s, cook_time: params[:cook_time].to_i)
  redirect to("/")
end

get '/recipes/new' do
  @recipe = Recipe.new
  erb :new
end

get '/recipes' do
  redirect to("/")
end

get '/recipes/view/:id' do
  @recipe = Recipe.get(params[:id])
  erb :viewRecipe
end