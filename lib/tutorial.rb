require "gosu"
require "progressbar"
require_relative "drm"
require_relative "questions"
class Tutorial
	def initialize
		dick = Drm.new
		puts dick.check
		unless dick.success
			exit
		end
		ptime = rand(200)
		puts "Loading progress bars!"
		pbar = ProgressBar.new("Waiting", ptime)
		ptime.times {sleep(0.1); pbar.inc}; pbar.finish
		prog = IO.readlines("#{$ASSET_PATH}/loading.txt")
		prog.shuffle!
		rand(6).times do
			puts prog.pop
			ptime = rand(100)
			pbar = ProgressBar.new("Waiting", ptime)
			ptime.times {sleep(rand); pbar.inc}; pbar.finish
		end
		$stderr.reopen("tutorial_err.txt", "w")
		@song = Gosu::Sample.new("#{$ASSET_PATH}/TutorialMenu.ogg")
		@song.play(1,1,true)
	end
	def start
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
