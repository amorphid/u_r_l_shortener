require "active_record"

namespace :create do
  desc "Creates a database called u_r_l_shortener"

  task :database do
    begin
      ActiveRecord::Base.establish_connection( adapter:  ENV["DATABASE_ADAPTER"],
                                               database: ENV["EXISING_DATABASE"] )
      ActiveRecord::Base.connection.create_database( ENV["DATABASE_TO_CREATE"] )

      text  = "\n"
      text += "Rake task successfully completed\n"
      text += "Database '#{ENV["DATABASE_TO_CREATE"]}' has been created\n"
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
