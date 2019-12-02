class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :name, :role, :avatar

  def avatar
    url_for(object.avatar) if object.avatar.attached?
  end
end
