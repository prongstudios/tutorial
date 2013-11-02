require "gosu"
require_relative "drm"
require_relative "questions"
class Tutorial
	def start
		dick = Drm.new
		puts dick.check
		$stderr.reopen("tutorial_err.txt", "w")
		@song = Gosu::Sample.new("#{$ASSET_PATH}/TutorialMenu.ogg")
		@song.play(1,1,true)
		question = Question.new(File.read("#{$ASSET_PATH}/questions/1.json"))
			puts question.prompt
		unless question.check(gets.chomp)
			puts "Game Over!"
		end
	end
end
