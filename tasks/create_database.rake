require "active_record"

namespace :create do
  desc "Creates a database named '#{ENV["APP_DATABASE"]}'"

  task :database do
    begin
      ActiveRecord::Base.establish_connection( adapter:  ENV["DATABASE_ADAPTER"],
                                               database: ENV["NON_APP_DATABASE"] )
      ActiveRecord::Base.connection.create_database( ENV["APP_DATABASE"] )

      text  = "\n"
      text += "Rake task successfully completed\n"
      text += "Database '#{ENV["APP_DATABASE"]}' has been created\n"
      text += "\n"

      puts text
    rescue Exception => exception
      text  = "\n"
      text += "#{exception}\n"
      text += "\n"

      puts text
    end
  end
end
