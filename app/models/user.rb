class User < ApplicationRecord
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
