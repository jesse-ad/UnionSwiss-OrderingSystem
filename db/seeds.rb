

# Admin user
admin = User.create(
  email: "admin1@gmail.com",
  password: "admin1",
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
  email: "canada@gmail.com",
  password: "canada",
  role: "distributor",
  distributor: canada
)
kuwait_user = User.create(
  email: "kuwait@gmail.com",
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
  price_per_unit: 10.99
)
Sku.create(
  distributor: canada,
  product: oil_60ml,
  price_per_unit: 7.99
)
Sku.create(
  distributor: canada,
  product: oil_25ml,
  price_per_unit: 4.99
)

Sku.create(
  distributor: kuwait,
  product: oil_25ml,
  price_per_unit: 2.99
)
Sku.create(
  distributor: kuwait,
  product: oil_60ml,
  price_per_unit: 5.99
)
Sku.create(
  distributor: kuwait,
  product: oil_25ml,
  price_per_unit: 2.99
)
Sku.create(
  distributor: kuwait,
  product: skin_gel_200ml,
  price_per_unit: 6.99
)
