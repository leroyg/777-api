namespace :seven do
  desc "Set tokens on all photos"
  task :token => :environment do

    require 'securerandom'

    Photo.find_each do |photo|
      photo.token = SecureRandom.hex
      photo.save
    end
  end
end
