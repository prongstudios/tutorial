require 'rest-client'
class Drm
	def check
		begin
			RestClient.get('http://tutorialthegame.com/xdrm')
			return 'drm connected'
		rescue Exception => e
			return 'error checking drm: ' + e.message
		end
	end
end

