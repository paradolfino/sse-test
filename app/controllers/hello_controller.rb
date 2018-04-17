class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    loop do
      @transaction = Transaction.last
      @transactions = Transaction.all
      if @transactions
        response.stream.write "#{@transaction.content} <br/>"
      end
      sleep 2
    end
    response.stream.close
  end
end
