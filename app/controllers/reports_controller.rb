class ReportsController < ApplicationController
    def new
        @report = Report.new
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def create
         rp = report_params
        ll = getGeocode(rp[:location]).split(',')
        rp[:lat] = ll[0]
        rp[:lng] = ll[1]
        @report = Report.new(rp)
        
        if @report.save
            redirect_to action: "index"
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
        @hash = Gmaps4rails.build_markers(@reports) do | report, marker|
            marker.lat report.lat
            marker.lng report.lng
            marker.title report.title
            marker.infowindow report.desc
        end
    end
    
    #destroy method to use when destroyed by user (ie, via webpage)
    def destroy
        @report = Report.find(params[:id])
        ReportMailer.destroyed_mail(@report).deliver_now
        @report.destroy
        redirect_to reports_path
    end
    
    def destroy_by_id(id_to_destroy)
        @report = @reports
        ReportMailer.destroyed_mail(@report).deliver_now
        @report.destroy
    end
    
    private #~~~~~PRIVATE METHODS BELOW HERE
    
    #given a string uses google api to convert to lat&long.
        def getGeocode loc_string
            Geokit::Geocoders::GoogleGeocoder.api_key = Rails.application.secrets.GOOGLE_MAPS_API_KEY
            req = Geokit::Geocoders::GoogleGeocoder.geocode(loc_string)
            return req.ll
        end
        
        def report_params
            params.require(:report).permit(:title, :location, :desc,
            :email)
        end
end