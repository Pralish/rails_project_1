class Post < ApplicationRecord
    default_scope {order(created_at: :desc)}
    paginates_per 5
    has_rich_text :body 
    has_many :comments, dependent: :destroy
    has_many_attached :images
    belongs_to :user, optional: true
end
