class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    @transaction = Transaction.last
    loop do
      if @transaction != @last
        response.stream.write "#{@transaction.content} <br/>"
        response.stream.close
      end
      sleep 2
    end
    
  end
end
