require "connectfour.rb"

describe ConnectFour do 

	let(:game) { ConnectFour.new }

	describe "#set_board" do
		it "sets a 4x4 board" do
			expect(game.set_board).to eql([["_", "_", "_", "_"],["_", "_", "_", "_"],
									  ["_", "_", "_", "_"],["_", "_", "_", "_"]])
		end
	end

	describe "#show_moves" do

		it "shows the available moves" do
			game.instance_variable_set :@board, [["_", "_", "_", "_"],["_", "_", "_", "_"],
									  ["_", "_", "_", "_"],["_", "_", "_", "_"]]
			expect{game.show_moves}.to output("You may choose:\n0\n1\n2\n3\n").to_stdout

		end

		it "only shows the available lanes" do
			game.instance_variable_set :@board, [["1", "1", "1", "1"],["_", "_", "_", "_"],
									  ["0", "0", "0", "0"],["_", "_", "_", "_"]]
			expect{game.show_moves}.to output("You may choose:\n1\n3\n").to_stdout
		end

		#make this last test check if all the slots are NOT "_"--it should return gameover
		#it "only shows the available lanes" do
		#	game.instance_variable_set :@board, [["1", "1", "1", "1"],["_", "_", "_", "_"],
		#							  ["0", "0", "0", "0"],["_", "_", "_", "_"]]
		#	expect{game.show_moves}.to output("You may choose:\n1\n3\n").to_stdout
		#end

	end

	describe "#set_symbol" do
			it "sets the @sym based on the turn number" do
	          game.instance_variable_set :@counter, 2
			  expect(game.set_symbol).to eql("1")
		    end	

		    it "sets the @sym based on the turn number" do
	          game.instance_variable_set :@counter, 3
			  expect(game.set_symbol).to eql("0")
		    end	
	end

	describe "#check_move" do
		it "checks if user's choice is valid" do
			game.instance_variable_set :@user_options, [1]
			game.instance_variable_set :@user_choice, 1
			expect(game.check_move).to eql("valid")
		end
	end

	describe "#set_move" do
		it "changes board to represent user choice" do
			game.set_board			
			game.instance_variable_set :@counter, 2
			game.set_symbol
			game.instance_variable_set :@user_choice, 2
			expect(game.set_move).to eql([["_", "_", "_", "_"],["_", "_", "_", "_"],
									  ["1", "_", "_", "_"],["_", "_", "_", "_"]])
		end

		it "changes board when symbol is 0" do
			game.set_board			
			game.instance_variable_set :@counter, 3
			game.set_symbol
			game.instance_variable_set :@user_choice, 1
			expect(game.set_move).to eql([["_", "_", "_", "_"],["0", "_", "_", "_"],
									  ["_", "_", "_", "_"],["_", "_", "_", "_"]])
		end
	end

	describe "#draw" do
		it "shows the current board" do
			game.instance_variable_set :@board, [["_", "_", "_", "_"],["_", "_", "_", "_"],
									  ["_", "_", "_", "_"],["_", "_", "_", "_"]]
			expect{game.draw}.to output("Board:\n____\n____\n____\n____\n").to_stdout
		end
	end
	
	describe "#check" do
		it "checks if bottom row is all 1" do
			game.instance_variable_set :@board, [["1", "_", "_", "_"],["1", "_", "_", "_"],
									  			["1", "_", "_", "_"],["1", "_", "_", "_"]]
			expect(game.check).to eql("Player 1 wins!")
		end

		it "checks if top row is all 0" do
			game.instance_variable_set :@board, [["0", "_", "1", "0"],["0", "_", "_", "0"],
									  			["1", "_", "_", "0"],["1", "_", "_", "0"]]
			expect(game.check).to eql("Player 0 wins!")
		end

		it "checks if a diagonal row is all 0" do
			game.instance_variable_set :@board, [["0", "_", "1", "0"],["0", "0", "_", "1"],
									  			["1", "_", "0", "1"],["1", "_", "_", "0"]]
			expect(game.check).to eql("Player 0 wins!")
		end

		it "checks if a 'vertical' row is all 1" do
			game.instance_variable_set :@board, [["1", "1", "1", "1"],["0", "0", "_", "1"],
									  			["1", "_", "0", "1"],["1", "_", "_", "0"]]
			expect(game.check).to eql("Player 1 wins!")
		end

	end

	describe "#gameplay" do
		it "continues for 16 turns" do
			expect(game.gameplay).to eql(true)
		end
	end
end