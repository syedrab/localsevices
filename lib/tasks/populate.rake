# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    # Create Roles
    admin_role = Role.create!(:name => "Admin",
      :description => "Admin, Manage All")

    seller_role = Role.create!(:name => "Seller",
      :description => "Seller can manage store, services and transactions")

    admin_role = Role.create!(:name => "Buyer",
      :description => "Can search, view and purchase new services")

    # Create admin_user account
    admin_user = User.create!(:email => "syed.rab@keepitlocal.com",
      :password => "password",
      :password_confirmation => "password",
      :role_id => 1,
      :admin => true)
      
    # Create test user accounts
    10.times do |n|
      email = "test-#{n+1}@test.org"
      password = "password"
      test_user = User.create!(
        :email => email,
        :password => password,
        :password_confirmation => password,
        :role_id => 3)
    end
  end
end