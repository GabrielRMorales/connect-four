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
  @counter%2==0 ? @sym="1" : @sym="0"  
end

def get_user_choice
	@user_choice=gets.chomp.to_i
	puts "user chose #{@user_choice}"
end


def check_move
	if @user_options.include? (@user_choice)
		return "valid"
	else
		get_user_choice
		check_move
	end
end

def set_move
	pos=@board[@user_choice].index("_")

	@board[@user_choice][pos]=@sym
	@board
end

def draw
	puts "Board:"
	@board.each { |x| 
	x.each { |y|
	print y }
	puts ""	}
end

def check
  win_conditions= [

    [@board[0][0], @board[1][0],@board[2][0],@board[3][0]],
    [@board[0][1], @board[1][1],@board[2][1],@board[3][1]],
    [@board[0][2], @board[1][2],@board[2][2],@board[3][2]],
    [@board[0][3], @board[1][3],@board[2][3],@board[3][3]],

    [@board[0][0], @board[1][1],@board[2][2],@board[3][3]],
    [@board[3][0], @board[2][1],@board[1][2],@board[0][3]],

    [@board[0][0], @board[0][1],@board[0][2],@board[0][3]],
    [@board[1][0], @board[1][1],@board[1][2],@board[1][3]],
    [@board[2][0], @board[2][1],@board[2][2],@board[2][3]],
    [@board[3][0], @board[3][1],@board[3][2],@board[3][3]],

	]

  win_conditions.each do |x|
    if x.all? {|y| y==x[0] && x[0]!="_"}
      @gameover=true
      puts "Player #{x[0]} wins!"
      return "Player #{x[0]} wins!"     
    end
  end
  nil
end

def gameplay
	set_board
	draw
	while @gameover==false && counter<17 do
		show_moves
		set_symbol
		get_user_choice
		check_move
		set_move
		draw
		check	
		@user_options=[]
		@counter+=1
	end
	@gameover=true
end


end

game=ConnectFour.new
game.gameplay
