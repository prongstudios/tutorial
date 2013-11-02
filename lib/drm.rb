require 'rest-client'
require 'json'
class Drm
	def check
		begin
			@response = RestClient.get 'http://tutorialthegame.com/pages/drm.json', {:accept => :json}
			return JSON.parse(@response)["status"]
		rescue Exception => e
			return 'error checking drm: ' + e.message
		end
	end
	def success
			return JSON.parse(@response)["success"]
	end
end

