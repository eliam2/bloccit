class  TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  #Intentionally allowing all users, not just admins to create topics
  def create?
    user.present?
  end

  def update?
    create?
  end

  def destroy?
    create?
    #user.present? && (record.user == user || user.admin? || user.moderator?)
  end

end