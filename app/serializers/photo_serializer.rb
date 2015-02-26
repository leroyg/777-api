class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :large_photo_url, :thumb_photo_url

  def large_photo_url
    object.photo.url(:large)
  end

  def thumb_photo_url
    object.photo.url(:thumb)
  end

  def id
    object.token
  end
end
