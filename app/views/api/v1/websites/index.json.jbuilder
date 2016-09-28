json.websites @websites do |website|
  json.title website.title
  json.url   website.url

  json.links website.links, partial: 'links', as: :link
end
