class Report < ApplicationRecord

    validates :title, presence: true, length: { minimum: 3 }
    validates :desc, presence: true
    validates :location, presence:true, length: {minimum: 3 }
    
    #email regex from http://emailregex.com/
    validates :email, presence:true, length: {minimum: 4}, format: {
        :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ,
        message: "Please supply a valid email."
    }
        
end
