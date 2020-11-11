# Delete ALL block
ProductsOrder.delete_all
Category.delete_all
Product.delete_all
Order.delete_all
Address.delete_all
Province.delete_all
Customer.delete_all

# Seed block
## Provinces
Province.create(
  name:     "Alberta",
  code:     "AB",
  gst_rate: 0.05
)

Province.create(
  name:     "British Columbia",
  code:     "BC",
  gst_rate: 0.05,
  pst_rate: 0.07
)

Province.create(
  name:     "Manitoba",
  code:     "MB",
  gst_rate: 0.05,
  pst_rate: 0.07
)

Province.create(
  name:     "New Brunswick",
  code:     "NB",
  hst_rate: 0.15
)

Province.create(
  name:     "Newfoundland and Labrador",
  code:     "NL",
  hst_rate: 0.15
)

Province.create(
  name:     "Nova Scotia",
  code:     "NL",
  hst_rate: 0.15
)

Province.create(
  name:     "Northwest Territories",
  code:     "NT",
  gst_rate: 0.05
)

Province.create(
  name:     "Nunavut",
  code:     "NU",
  gst_rate: 0.05
)

Province.create(
  name:     "Ontario",
  code:     "ON",
  hst_rate: 0.13
)

Province.create(
  name:     "Prince Edward Island",
  code:     "PE",
  hst_rate: 0.15
)

Province.create(
  name:     "Quebec",
  code:     "QC",
  gst_rate: 0.05,
  pst_rate: 0.09975
)

Province.create(
  name:     "Saskatchewan",
  code:     "SK",
  gst_rate: 0.05,
  pst_rate: 0.06
)

Province.create(
  name:     "Yukon",
  code:     "YT",
  gst_rate: 0.05
)

## Categories
staplers = Category.create(
  name:        "Staplers",
  description: "Different types of staplers."
)

staplers_large = Category.create(
  name:        "Paper Finishing Staplers",
  description: "Staplers for finishing papers.",
  parent:      staplers
)

staplers_desktop = Category.create(
  name:        "Desktop Staplers",
  description: "For all your stapling needs.",
  parent:      staplers
)

writing_utensils = Category.create(
  name:        "Writing Utensils",
  description: "Things to write with."
)

writing_utensils_pencils = Category.create(
  name:        "Pencils",
  description: "Writing with graphite.",
  parent:      writing_utensils
)

writing_utensils_pens = Category.create(
  name:        "Pens",
  description: "Writing with ink.",
  parent:      writing_utensils
)

writing_utensils_markers = Category.create(
  name:        "Markers",
  description: "Markers and Highlighters.",
  parent:      writing_utensils
)

categories = [staplers_large, staplers_desktop, writing_utensils_pens, writing_utensils_markers, writing_utensils_pencils]

## Products
categories.each do |c|
  20.times do
    cost = Faker::Commerce.price
    product = c.products.create(
      upc:         Faker::Barcode.unique.upc_a,
      name:        Faker::Commerce.unique.product_name,
      cost:        cost,
      price:       cost * 1.75,
      description: Faker::Hacker.say_something_smart,
      on_hand:     Faker::Number.between(from: 1, to: 1000)
    )
    query = URI.encode_www_form_component(product.name)
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    product.image.attach(io: downloaded_image, filename: "m-#{product.upc}.jpg")
  end
end

# Active Admin
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
