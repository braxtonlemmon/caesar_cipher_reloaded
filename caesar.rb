require "bundler"
Bundler.require

class CaesarCipher < Sinatra::Base
	get "/" do
		"erb :index"
	end
end