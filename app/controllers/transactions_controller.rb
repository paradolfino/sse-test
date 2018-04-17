class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end
    
    def create
        
    end
    
    private
        
        def transaction_params
           params.require(:transaction).permit(:content) 
        end
end
