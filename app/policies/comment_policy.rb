class  CommentPolicy < ApplicationPolicy

  def show?
    user.present?
  end

end