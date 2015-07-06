class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true  # Anyone can view a job
  end

  def create?
    true  # Anyone can create a job
  end

  def update?
    record.user == user  # Only job creator can update it
  end

  def destroy?
    record.user == user  # Only job creator can update it
  end
end
