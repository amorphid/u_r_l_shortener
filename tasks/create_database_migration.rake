require "active_record"

namespace :create do
  desc "Creates an ActiveRecord migration"


  task :database_migration do
    directory1 = "./database/"
    directory2 = "./database/migrations/"

    [directory1, directory2].each do |directory|
      system("mkdir " + directory) if Dir[directory].empty?
    end

    old_migrations = Dir[directory2 + "*"]

    old_migrations_parsed = old_migrations.map do |migration|
      migration_split = migration.split("/")[-1].split("_")
      number = migration_split[0]
      slug = migration_split[1..-1].join("_")[0..-4]
      [number, slug]
    end unless old_migrations.empty?

    last_migration_number = unless old_migrations_parsed.nil?
      old_migrations_parsed.sort[-1][0]
    else
      0
    end

    slug = ENV["SLUG"]

    migration = ActiveRecord::Migration.new
    next_migration_number = migration.next_migration_number(0)

    duplicate = if old_migrations.empty?
      false
    elsif old_migrations_parsed.nil?
      false
    else
      old_migrations_parsed.map { |migration| migration[-1] }.include? slug
    end

    unless duplicate == true
      file_name = next_migration_number.to_s + "_" + slug + ".rb"

      contents  = "class " + slug.split("_").map { |i| i.capitalize }.join + " < ActiveRecord::Migration\n"
      contents += "  def change\n"
      contents += "  end\n"
      contents += "end\n"

      File.write(directory2 + file_name, contents)
    else
      puts "\nduplicate\n\n"
    end
  end
end
