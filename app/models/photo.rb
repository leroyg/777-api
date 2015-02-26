require 'securerandom'

class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  before_validation on: :create do
    self.token = SecureRandom.hex
  end
end
