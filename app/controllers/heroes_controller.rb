class HeroesController < ApplicationController
    def new
        @hero = Heros.new
    end
    
    def create 
        
        @hero = Heros.new(article_params)
       byebug
       
      if @h.save
          byebug
          redirect_to @article 
      else
          render 'new'
      end
   end
    
    def show
       @hero = Heros.find(params[:id]) 
    end
    
    def edit
        @hero = Heros.find(params[:id])
        if @hero.update(hero_params)
            redirect_to @hero
        else 
            render 'edit'
        end
    end
    
    def index
        @hero = Heros.all
    end
    
    def destroy
        @hero = Heros.find(params[:id])
    end
    
end

private hero_params
    params.require(:hero).permit(:name, :ability)
   end
   
