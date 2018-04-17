class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    @transaction = Transaction.last
    loop do
      sleep 1
      @transaction = Transaction.last
      if @transaction != @last
        response.stream.write "#{@transaction.content} <br/>"
        sleep 1
      end
      sleep 1
    end
    response.stream.close
  end
end
