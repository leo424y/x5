desc "This task is called by the Heroku scheduler add-on"
task :send_reminders => :environment do
  tasks = TasksController.new
  tasks.deadline_mailer
end