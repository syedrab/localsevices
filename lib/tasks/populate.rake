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
      
    # Create test company user accounts and companies
    10.times do |n|
      email = "seller-#{n+1}@keepitlocal.com"
      password = "password"
      test_user = User.create!(
        :email => email,
        :password => password,
        :password_confirmation => password,
        :role_id => 2)
      test_company = Company.create!(
        :name => Faker::Company.name, 
        :description => Faker::Lorem.paragraph(sentence_count = 3), 
        :website => 'www.'+Faker::Company.name+'.com', 
        :email => email, 
        :phone => Faker::Number.number(10), 
        :fax => Faker::Number.number(10), 
        :address1 => Faker::Address.street_address, 
        :address2 => Faker::Address.secondary_address, 
        :city => ['Toronto', 'Pickering', 'Burlington', 'Brampton', 'Mississauga', 'Markham', 'Richmondhill', 'Vaughan', 'Milton', 'Newmarket'].sample, 
        :province => 'Ontario', 
        :postal_code => Faker::Address.zip_code, 
        :country => 'Canada', 
        :image_url => Faker::Company.logo, 
        :num_rating => 0,
        :user_id => test_user.id
        )
        test_user.company_id = test_company.id
        test_user.save
        5.times do |sample|
          test_service = Service.create!(
            :name => Faker::Commerce.product_name, 
            :description => Faker::Company.catch_phrase, 
            :price => Faker::Commerce.price,
            :company_id => test_company.id, 
            :service_type_id => [*1..10].sample
          )
          test_service_area = ServiceArea.create!(
            :city => 'Toronto', 
            :service_id => test_service.id,
            :company_id => test_company.id
          )
        end
    end

    10.times do |n|
      service_type = ServiceType.create!(:name => Faker::Commerce.department(n+1));
    end

    # Create test user accounts
    10.times do |n|
      email = "buyer-#{n+1}@keepitlocal.com"
      password = "password"
      test_user = User.create!(
        :email => email,
        :password => password,
        :password_confirmation => password,
        :role_id => 3)
    end
  end
end