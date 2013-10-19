require 'rest-client'
class Drm
	def check
		begin
			RestClient.get('http://tutorialthegame.com/drm')
			puts 'drm connected'
		rescue Exception => e
			puts 'error checking drm'
			puts e.message
		end
	end
end

