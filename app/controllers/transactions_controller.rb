class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end
    
    def create
        @transaction = Transaction.new(transaction_params)
    end
    
    private
        
        def transaction_params
           params.require(:transaction).permit(:content) 
        end
end
