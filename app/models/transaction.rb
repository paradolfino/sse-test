class Transaction < ApplicationRecord
    include ActiveModel::Dirty
    define_attribute_methods :content
    def initialize
        @content = nil
    end
    
    def content
        @content
    end
    
    def content=(val)
        content_will_change! unless val == @content
        @content = val
    end
    
    def save
        # do persistence work
    
        changes_applied
    end
    
    def reload!
        # get the values from the persistence layer
    
        clear_changes_information
    end
    
    def rollback!
        restore_attributes
    end
end
