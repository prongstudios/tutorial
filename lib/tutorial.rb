require "gosu"

class Tutorial
	def start
		$stderr.reopen("tutorial_err.txt", "w")
		@song = Gosu::Sample.new("#{$ASSET_PATH}/TutorialMenu.ogg")
		@song.play(1,1,true)
		name_menu = Menu.new
		name_menu.add_prompt "Welcome to Tutorial: The Game. To continue, please select the number corresponding with the letter 'A'."
		name_menu.add_options "A"
		name_menu.add_options "B"
		name_menu.add_options "C"
		name_menu.prompt
	
		name_menu = Menu.new
		name_menu.add_prompt "Great Job! Please select the number you chose to successfully pass the first level."
		name_menu.add_options "2"
		name_menu.add_options "1"
		name_menu.add_options "3"
		name_menu.prompt
	end
end

class Menu
	def initialize(options = [], prompt = [])
		@options = options
		@prompt = prompt
		@sounds = File.join(File.dirname(__FILE__), '..', 'sounds')
	end
	def add_options(new_options)
		@options.push new_options
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

