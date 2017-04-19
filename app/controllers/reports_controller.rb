class ReportsController < ApplicationController
    def new
        @report = Report.new
    end
    
    def show
        @report = Report.find(params[:id])
    end
    
    def create
        rp = report_params
        
        #ll is a string containing both lattitude and longitude from
        #google's geo-coder
        ll = getGeocode(rp[:location]).split(',')
        #after splitting we set them to the object before saving.
        rp[:lat] = ll[0]
        rp[:lng] = ll[1]
        @report = Report.new(rp)
        
        
        
        #finally, saving the object.
        if @report.save
            redirect_to action: "index"
        else
         render 'new'
        end
        
        #this code adds the object's destruction as a delayed job.
        time_delay = Time.now + 60 # later edit this to have some sort of randomness
        @report.delay(:run_at => time_delay).destroy()
        
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