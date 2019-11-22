class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && @post.user == user
  end

  def destroy?
    user.present? && (user.role == 'admin' || @post.user == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
