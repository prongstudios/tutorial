require "json"


class Question
	def initialize(json_file)
	        @questions = JSON.parse(json_file)
	end
	def prompt
        	puts @questions["question"]
		puts @questions["1"]
        	puts @questions["2"]
        	puts @questions["3"]
        	puts @questions["4"]
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
