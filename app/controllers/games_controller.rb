class GamesController < ApplicationController

  def new
    @letters = ('a'.. 'z').to_a.shuffle[0..10].join.upcase
  end

  def score
    @response = params[:letters]
    @answer = ''
    ### not built with original grid
    if @response
      then @answer = "Sorry but '#{@response}' cannot be built out of '#{@letters}' "
    ### not a valid english word
    elsif @response.validation == false
      then @answer = "Sorry buy '#{@response}' is not a valid English word"
    else
      @answer = "CONGRATULATIONS! '#{@response}' is a valid English word!"
    end
  end
end

def validation(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json.JSON.parse(response.read)
  json['found']
end
