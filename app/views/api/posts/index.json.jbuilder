json.posts @posts do |post|
    json.post post
    json.images post.images do |image|
       json.url  url_for(image)
    end
end
