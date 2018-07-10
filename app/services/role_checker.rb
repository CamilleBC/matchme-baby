# frozen_string_literal: true

module RoleChecker
  def user?
    return true if role == 'user'
    false
  end

  def admin?
    return true if role == 'admin'
    false
  end
end
