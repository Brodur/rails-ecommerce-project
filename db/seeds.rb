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

## Active Admin
# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
# end
