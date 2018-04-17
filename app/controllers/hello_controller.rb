class HelloController < ApplicationController
  include ActionController::Live
  def index
    @last = Transaction.last
    loop do
      @transaction = Transaction.last
      if @transaction != @last
        response.stream.write "#{@transaction.content} <br/>"
      end
      sleep 2
    end
    response.stream.close
  end
end
