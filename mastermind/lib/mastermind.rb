#require "mastermind/version"

module Mastermind
	class Game
		def initialize
			intro
			generate_code
			@turns_left = 12
			the_game
		end
		def generate_code
			code =[]
			@colors = ["red", "blue", "green", "purple", "yellow", "pink"].sample(4)
			code.push(@colors)
			@code=code.join(', ')
			puts @code
		end
		def intro
			puts "Welcome to Mastermind!"
			puts "Please enter a color. It is not case sensitve"
			puts "You have 12 chances to make a correct sequence"
		end
		def the_game
			catch (:done) do
				while @turns_left > 0
					puts "You have #{@turns_left} turns left."
					player_guess = gets.chomp
					throw :done if player_guess == "exit"
					result = inspect_guess(player_guess)
					if player_guess==@code
						Puts "You did it!"
						throw :done
					else
						puts "Your guess: #{player_guess} | Result: #{result}"	
					end
					@turns_left -= 1
				end
				puts "Too bad, I guess you're too stupid."
				puts "The code was #{@code}"
					throw :done
					
				
			end
		end

		def inspect_guess(player_guess)
			result = []
			player_guess.split(' ').each_with_index {|color,index|
				if @code.include?(color)
								
						if @code[index] == player_guess[index]
							result << "B"
						else
							result << "W"
						end
					end
				
			}
			result.to_s
		end
	end
	Game.new
end
	


