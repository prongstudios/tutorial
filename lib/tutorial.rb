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
		dir = Dir.entries("assets/questions").reject{|entry| entry =~ /^\.{1,2}$/}
		dir.each do |test|
			q = Question.new "assets/questions/#{test}"
			puts q.prompt
			unless q.check(gets.chomp)
				puts "You have failed your quest and must start again."
				start
			end
		end
		puts "You arrive at the base of Mt. Tortalialis. To continue your adventure, purchase our DLC."
	end
end
