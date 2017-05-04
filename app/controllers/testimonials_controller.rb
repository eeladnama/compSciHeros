class TestimonialsController < ApplicationController
    def index
       
    end
    
    def new
        @testimonial = Testimonial.new
    end
    
    def create
        @testimonial = Testimonial.new(testimonial_params)
        
        if @testimonial.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end
    
    def show
        @testimonial = Testimonials.find(params[:id])
    end
    
    private
    
    def testimonial_params
        params.require(:testimonial).permit(:name, :title, :desc)
    end
    
end
