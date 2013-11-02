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
		name_menu = Menu.new
		name_menu.add_option "Rumplestilskin"
		name_menu.add_option "Beetlejuice"
		name_menu.add_option "Bosie"
		case name_menu.prompt
		when 1
			rump_menu = Menu.new
			rump_menu.add_option "Touch my rump"
			rump_menu.add_option "Spin me some golden thread"
			rump_menu.add_option "press 3 to see what this does"
			rump_menu.add_option "press 4 to see what this does"
			rump_menu.prompt
		end
	end
end

class Menu
	def initialize(options = [], prompt = [])
		@options = options
		@prompt = prompt
		@sounds = File.join(File.dirname(__FILE__), '..', 'sounds')
	end
	def add_option(new_option)
		@options.push new_option
	end
	def add_prompt(new_prompt)
		@prompt.push new_prompt
	end
	def prompt
		puts @prompt
		@options.each_with_index do |text,i|
			puts "#{i+1}. #{text}"
		end
		choice = gets.chomp
		if @options.fetch(choice.to_i - 1,nil) and choice.to_i != 0
			return choice.to_i
		else
			puts "I'm sorry but \"#{choice}\" is an invalid choice."
			prompt
		end
	end
end

