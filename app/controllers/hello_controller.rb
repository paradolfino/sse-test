class HelloController < ApplicationController
  include ActionController::Live
  def index
    
    loop do
      @transaction = Transaction.last
      @transactions = Transaction.all
      if @transaction
      response.stream.write @transaction.content
      sleep 2
    end
    response.stream.close
  end
end
