class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    @transaction = Transaction.last
    loop do
      if @transaction != @last
        #response.stream.write "#{@transaction.content} <br/>"
        redirect_to '/'
      end
      sleep 2
    end
    response.stream.close
  end
end
