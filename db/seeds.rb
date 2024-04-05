# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
# #   end
Faker::UniqueGenerator.clear

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end if Rails.env.development?

['about', 'contact'].each do |page_type|
  PageInfo.find_or_create_by!(page_type: page_type) do |page|
    page.title = "#{page_type.titleize} Page"
    page.content = "Initial content for #{page_type.titleize}."
  end
end

# Extended category names
category_names = [
  "Computers", "Peripherals", "Office Furniture", "Tech Gadgets",
  "Smartphones", "Audio & Video", "Photography Equipment", "Gaming Consoles",
  "Wearable Technology", "Networking Devices", "Software", "DIY Electronics"
]

# Ensure unique Faker data for product names
Faker::UniqueGenerator.clear

# Create categories
categories = category_names.map do |name|
  Category.find_or_create_by!(name: name)
end

# Seed Products for each Category
categories.each do |category|
  10.times do
    Product.create!(
      name: Faker::Commerce.unique.product_name,
      description: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 10..1000.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100),
      category: category
    )
  end
end

puts "Created #{Category.count} categories and #{Product.count} products."
