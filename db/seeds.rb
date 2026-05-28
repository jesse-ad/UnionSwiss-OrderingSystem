

# Admin user
admin = User.create(
  email: "unionswiss_user@gmail.com",
  password: "unionswiss",
  role: "admin"
)

# Distributors
canada = Distributor.create(
  name: "Canada", 
  currency: "CAD"
)
kuwait = Distributor.create(
  name: "Kuwait",
  currency: "KWD"
)
# Distributer users
canada_user = User.create(
  email: "canada_user@gmail.com",
  password: "canada",
  role: "distributor",
  distributor: canada
)
kuwait_user = User.create(
  email: "kuwait_user@gmail.com",
  password: "kuwait",
  role: "distributor",
  distributor: kuwait
)

# Products
skin_gel_200ml = Product.create(
  name: "Bio-Oil Dry Skin Gel 200ml"
)
oil_25ml = Product.create(
  name: "Bio-Oil Dry Skincare Oil 25ml"
)

oil_60ml = Product.create(
  name: "Bio-Oil Dry Skincare Oil 60ml"
)

# SKUs
Sku.create(
  distributor: canada,
  product: skin_gel_200ml,
  price_per_unit: 120
)
Sku.create(
  distributor: canada,
  product: oil_60ml,
  price_per_unit: 95
)
Sku.create(
  distributor: kuwait,
  product: oil_25ml,
  price_per_unit: 70
)
Sku.create(
  distributor: kuwait,
  product: oil_60ml,
  price_per_unit: 90
)


