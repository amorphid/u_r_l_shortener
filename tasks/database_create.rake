namespace :database do
  ENV["DATABASE_ADAPTER"]    = "postgresql"
  ENV["EXISING_DATABASE"]    = "postgres"
  ENV["DATABASE_TO_CREATE"]  = "u_r_l_shortener"

  desc "Creates the database"

  task :create do
    begin
      ActiveRecord::Base.establish_connection( ENV["DATABASE_ADAPTER"],
                                               ENV["EXISING_DATABASE"] )
      ActiveRecord::Base.connection.create_database("u_r_l_shortener")
    rescue
      text =  "\n"
      text += "Rake aborted.\n"
      text += "The database '#{ENV["DATABASE_TO_CREATE"]}' already exists.\n"
      text += "\n"

      puts text
    end
  end
end
