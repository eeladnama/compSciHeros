class Hero < ApplicationRecord
    validates :name, presence: true
    validates :biography, presence: true
end
