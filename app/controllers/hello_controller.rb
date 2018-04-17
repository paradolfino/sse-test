class HelloController < ApplicationController
  include ActionController::Live
  def index
    @transaction = Transaction.last
    5.times do
      response.stream.write "World <br/>"
      sleep 2
    end
    response.stream.close
  end
end
