# # json.extract! @category, :name, :created_at
json.(@category, :id, :name, :updated_at)
# json.merge! @category.attributes
# json.set! :author do
#   json.set! :name, 'David'
# end
#
# hash = { author: { name: "David" } }
# json.post do
#   json.title "Merge HOWTO"
#   json.merge! hash
# end
