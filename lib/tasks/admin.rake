namespace :admin do
  desc "Create an admin user"
  task :create, [:email, :password, :name] => :environment do |t, args|
    if args[:email].blank? || args[:password].blank? || args[:name].blank?
      puts "Usage: bin/rails admin:create[email,password,name]"
      puts "Example: bin/rails 'admin:create[admin@example.com,secretpassword,Admin Name]'"
      exit 1
    end

    admin = Admin.new(
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password],
      name: args[:name]
    )

    if admin.save
      puts "Admin created successfully!"
      puts "  Email: #{admin.email}"
      puts "  Name: #{admin.name}"
    else
      puts "Failed to create admin:"
      admin.errors.full_messages.each { |msg| puts "  - #{msg}" }
      exit 1
    end
  end
end
