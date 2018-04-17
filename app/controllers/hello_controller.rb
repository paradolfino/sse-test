class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    @transaction = Transaction.last
    loop do
      @transaction = Transaction.last
      if @transaction != @last
        response.stream.write "#{@transaction.content} <br/>"
      end
      sleep 5
    end
    response.stream.close
  end
end
