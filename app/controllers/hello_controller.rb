class HelloController < ApplicationController
  include ActionController::Live
  def index
    
    loop do
      @transaction = Transaction.last
      @transactions = Transaction.all
      if @transactions.changed?
        response.stream.write @transaction.content
      end
      sleep 2
    end
    response.stream.close
  end
end
