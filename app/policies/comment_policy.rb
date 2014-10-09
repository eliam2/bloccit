class  CommentPolicy < ApplicationPolicy

  def show?
    user.present?
  end

  def destroy?
    can_moderate?(user, record)
  end

end