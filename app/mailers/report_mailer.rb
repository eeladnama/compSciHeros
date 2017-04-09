class ReportMailer < ApplicationMailer
    default from: 'PseudoHeroGirl@gmail.com'
    
    def destroyed_mail report
        @report = report
        @url  = 'http://example.com/login'
        mail(to: @report.email, subject: 'Your problem has been solved!')
    end
end
