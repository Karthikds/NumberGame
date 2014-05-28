class NumberGame

  def initialize
	@selected_operator = nil
	@dig_count = 0
	@numbers = []
	@user_answer = []
  end

  def start_game
  	instruct_users
	play_game
  end

  def instruct_users
  	puts "what operation( +, -, *, /) you want to perform"
  	@selected_operator = gets.chomp
  	puts "Enter the digits count you want to play"
	@dig_count = gets.chomp.to_i
  end

  def play_game
  	@numbers = get_numbers
	puts "what is the value of #{@numbers[0]} * #{@numbers[1]}"
	@user_answer = gets.chomp.to_i
	compute_operation_cmp_ans
  end
	
  def get_numbers
  	2.times{@numbers.push(rand.to_s[2..@dig_count+1])}
  	return @numbers.collect(&:to_i)
  end

  def compute_operation_cmp_ans
  	computed_answer = 0
  	computed_answer = eval("#{@numbers[0]} #{@selected_operator} #{@numbers[1]}")
  	if @user_answer == computed_answer
  	  puts "Super! you are a Math brainee..!!!"
  	else
  	  puts "Wrong answer! stop roaming with amegos and start studying..!!!"
  	  puts "correct answer is #{computed_answer}"
  	end
  end

  NumberGame.new.start_game

end