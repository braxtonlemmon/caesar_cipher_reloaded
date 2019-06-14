require "sinatra"
require "sinatra/reloader" if development?
require_relative "encoder"

get "/" do
	encoder = Encoder.new(params) 
	erb :index, locals: { encoder: encoder } 
end
