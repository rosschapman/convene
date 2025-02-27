# frozen_string_literal: true

# @see https://github.com/kzkn/gretel

crumb :marketplace do |marketplace|
  parent :room, marketplace.room
  link "Marketplace", marketplace.location
end

crumb :edit_marketplace do |marketplace|
  parent :room, marketplace.room
  link t("marketplace.marketplace.edit"), marketplace.location(:edit)
end

crumb :marketplace_checkout do |checkout|
  parent :marketplace, checkout.cart.marketplace
  link "Checkout", checkout.location
end

crumb :marketplace_order do |order|
  parent :marketplace_orders, order.marketplace
  link "Order from #{order.created_at.to_fs(:long_ordinal)}", order.location
end

crumb :marketplace_orders do |marketplace|
  parent :marketplace, marketplace
  link t("marketplace.order.index"), marketplace.location(child: :orders)
end

crumb :marketplace_products do |marketplace|
  parent :edit_marketplace, marketplace
  link t("marketplace.products.index.link_to"), marketplace.location(child: :products)
end

crumb :marketplace_product do |product|
  parent :marketplace_products, product.marketplace
  link product.name, product.location
end

crumb :new_marketplace_product do |product|
  parent :marketplace_products, product.marketplace
  link "Add a Product", marketplace.location(:new, child: :product)
end

crumb :edit_marketplace_product do |product|
  parent :marketplace_products, product.marketplace
  link t("marketplace.products.edit.link_to", name: product.name), product.location(:edit)
end

crumb :marketplace_delivery_areas do |marketplace|
  parent :edit_marketplace, marketplace
  link t("marketplace.delivery_areas.index.link_to"), marketplace.location(child: :delivery_areas)
end

crumb :new_delivery_area do |delivery_area|
  parent :marketplace_delivery_areas, delivery_area.marketplace
  link "Add a Delivery Area", marketplace.location(:new, child: :delivery_area)
end

crumb :edit_delivery_area do |delivery_area|
  parent :marketplace_delivery_areas, delivery_area.marketplace
  link t("marketplace.delivery_areas.edit.link_to", name: delivery_area.label), marketplace.location(:edit, child: :delivery_area)
end

crumb :marketplace_tax_rates do |marketplace|
  parent :edit_marketplace, marketplace
  link t("marketplace.tax_rates.index.link_to"), marketplace.location(child: :tax_rates)
end

crumb :new_tax_rate do |tax_rate|
  parent :marketplace_tax_rates, tax_rate.marketplace
  link "Add a Tax Rate", marketplace.location(:new, child: :tax_rate)
end

crumb :edit_tax_rate do |tax_rate|
  parent :marketplace_tax_rates, tax_rate.marketplace
  link "Edit Tax Rate '#{tax_rate.label}'", marketplace.location(:new, child: :tax_rate)
end
