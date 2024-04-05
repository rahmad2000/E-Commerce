class User < ApplicationRecord
  has_many :orders

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["orders"]
  end

    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "id_value", "is_admin", "name", "password_digest", "updated_at"]
  end
end
