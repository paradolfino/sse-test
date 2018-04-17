class HelloController < ApplicationController
  include ActionController::Live
  def index
    @transaction = Transaction.last
    @transactions = Transaction.all
    loop do
      if @transaction
      response.stream.write @transaction.content
      sleep 2
    end
    response.stream.close
  end
end
