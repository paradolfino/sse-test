class HelloController < ApplicationController
  include ActionController::Live
  def ticker
    @trans = Transaction.last
    @trans_last = @trans
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Ticker::SSE.new(response.stream)
    begin
      loop do
        @trans = Transaction.last
        if @trans != @trans_last
          sse.write({ time: Time.now })
          sleep 2
        end
      end
    rescue IOError
      logger.info 'Client disconnects causes IOError on write'
    ensure
      sse.close
    end
  end
end
