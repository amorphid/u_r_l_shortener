namespace :database do
  params = { adapter:      "postgresql",
             existing_db:  "postgres",
             db_to_create: "u_r_l_shortener" }

  desc "Creates the database"

  task :create do
    begin
      ActiveRecord::Base.establish_connection( params[:adapter],
                                               params[:existing_db] )
      ActiveRecord::Base.connection.create_database("u_r_l_shortener")
    rescue
      text =  "\n"
      text += "Rake aborted.\n"
      text += "A database named '#{params[:db_to_create]}' already exists.\n"
      text += "\n"

      puts text
    end
  end
end
