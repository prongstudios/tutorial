require "json"


class Question
	def initialize(json_file)
	        @questions = JSON.parse(json_file)
	end
	def prompt
        	prompt = @questions["question"] + "\n"
		@questions["options"].each do |item|
					item.each_pair do |key, value|
						prompt = prompt + "#{key}. #{value} \n"
						end
		end
		return prompt
	end
	def check(user_input)
		user_input == @questions["answer"]
	end
end
if __FILE__ == $0
	$ASSET_PATH = (File.join(File.dirname(__FILE__), '..', 'assets'))
	question = Question.new(File.read("#{$ASSET_PATH}/questions/1.json"))
	puts question.prompt
	unless question.check(gets.chomp)
		puts "Game Over!"
	end
end
