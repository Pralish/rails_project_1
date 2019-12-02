class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = 'localhost:3001'

  attributes :id, :body, :images
  has_many :comments
  belongs_to :user
  
  def images
    object.images.each_with_object([]) do |image, array|
      array << url_for(image)
    end
  end
end
