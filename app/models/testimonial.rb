class Testimonial < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }
    validates :desc, presence: true
    validates :name, presence:true, length: {minimum: 3 }
end
