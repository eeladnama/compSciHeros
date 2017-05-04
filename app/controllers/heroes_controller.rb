class HeroesController < ApplicationController
  
  def index
    @heroes = Hero.all
  end 
  
  def new
    @hero = Hero.new
  end
    
  def create
     @hero = Hero.new(hero_params)
        
     if @hero.save
       redirect_to action: "index"
     else
       render 'new'
     end
  end
    
    def show
        @hero = Hero.find(params[:id])
    end
end

private
    def hero_params
        params.require(:hero).permit(:name, :biography)
    end