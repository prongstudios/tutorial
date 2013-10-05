require "gosu"

class Tutorial
	def start
		$stderr.reopen("tutorial_err.txt", "w")
		@song = Gosu::Sample.new("#{$ASSET_PATH}/TutorialMenu.ogg")
		@song.play(1,1,true)
		name_menu = Menu.new
		name_menu.add "Rumplestilskin"
		name_menu.add "Beetlejuice"
		name_menu.add "Bosie"
		case name_menu.prompt
		when 1
			rump_menu = Menu.new
			rump_menu.add "Touch my rump"
			rump_menu.add "Spin me some golden thread"
			rump_menu.add "press 3 to see what this does"
			rump_menu.add "press 4 to see what this does"
			rump_menu.prompt
		end
	end
end

class Menu
	def initialize(prompt = [])
		@prompt = prompt
		@sounds = File.join(File.dirname(__FILE__), '..', 'sounds')
	end
	def add(new_prompt)
		@prompt.push new_prompt
	end
	def prompt
		@prompt.each_with_index do |text,i|
			puts "#{i+1}. #{text}"
		end
		choice = gets.chomp
		if @prompt.fetch(choice.to_i - 1,nil) and choice.to_i != 0
			return choice.to_i
		else
			puts "I'm sorry but \"#{choice}\" is an invalid choice."
			prompt
		end
	end
end

