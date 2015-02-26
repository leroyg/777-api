require 'securerandom'

class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  before_validation on: :create do
    self.token = SecureRandom.hex
  end

  after_create do
    Pusher['seven-live'].trigger('photoCreated', {
      model: PhotoSerializer.new(self).to_json
    })
  end
end
