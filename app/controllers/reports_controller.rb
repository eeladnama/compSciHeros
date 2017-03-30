class ReportsController < ApplicationController
    def new
        @report = Report.new
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def create
        @report = Report.new(report_params)
        
        if @report.save
            redirect_to @report
        else
         render 'new'
        end
    end
    
    def edit
        @report = Report.find(params[:id])
    end
    
    def update
        @report = Report.find(params[:id])
        if @report.update(report_params)
            redirect_to @report
        else
            render 'edit'
        end
    end
    
    def index
        @reports = Report.all
    end
    
    def destroy
        @report =Report.find(params[:id])
        @report.destroy
        
        redirect_to reports_path
    end
    
    private
    def report_params
        params.require(:report).permit(:title, :perpatrator, :location, :desc,
        :email)
    end
end