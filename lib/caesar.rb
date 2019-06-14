require "sinatra"
require "bundler"
require "./lib/encoder"
Bundler.require

class CaesarCipher < Sinatra::Base
	get "/" do
		encoder = Encoder.new(params) 
		erb :index, locals: { encoder: encoder } 
	end
end