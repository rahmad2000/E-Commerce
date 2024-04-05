class PageInfo < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "page_type", "title", "updated_at"]
  end
end
