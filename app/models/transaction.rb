class Transaction < ApplicationRecord
    include ActiveModel::Dirty
    define_attribute_methods :content
end
