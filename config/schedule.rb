set :output, "log/cron_log.log"

every 1.minute do
    runner "Report.destroy(Report.all.ids.sample(1))"
end
