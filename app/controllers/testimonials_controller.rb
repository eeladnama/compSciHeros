class TestimonialsController < ApplicationController
    def index
        @testimonials = Testimonial.all
    end
    def new
        @testimonial = Testimonials.new
    end
    
    def show
        @testimonial = Testimonials.find(params[:id])
    end
    
end
