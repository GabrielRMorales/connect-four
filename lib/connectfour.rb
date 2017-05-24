class ConnectFour

attr_accessor :board,:gameover, :counter, :sym, :user_options, :user_choice

def initialize
	@counter=0
	@gameover=false
	@user_options=[]
end

def set_board
	@board=[["_", "_", "_", "_"],["_", "_", "_", "_"],
			["_", "_", "_", "_"],["_", "_", "_", "_"]]
end

def show_moves
	puts "You may choose:\n"
	@board.each_with_index do |x,y|
		if x.any? {|z| z=="_"}
		@user_options<<y
		puts "#{y}"
		end
	end
	#@board.none? do |x|
	#	x.any? {|y| y==}
	#end
end

def set_symbol
  @counter%2==0 ? @sym="1": @sym="0"  
end

def get_user_choice
	@user_choice=gets.chomp
end

#try to make a while loop of this
def check_move
	if @user_options.include? (@user_choice)
		return "valid"
	else
		get_user_choice
		check_move
	end
end

def set_move
	@board[@user_choice] << @sym
	@board
end

def draw
	puts "Board:"
	@board.each { |x| 
	x.each { |y|
	print y }
	puts ""	}
end

def gameplay
	while @gameover==false && counter<17 do
		@user_options=[]
		@counter+=1
	end
	@gameover=true
end



end