class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end


  def destroy?
    user.present? && (@comment.user == user || user.role == 'admin' || @comment.post.user == user)
  end 
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
