class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :user_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Define ransackable associations
  def self.ransackable_associations(auth_object = nil)
    %w[order_items products user] # Use %w syntax for array of strings
  end

  # Define ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id status total_price updated_at user_id] # Correctly placed outside ransackable_associations
  end
end
