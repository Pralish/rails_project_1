require "spec_helper"

RSpec.describe "Post" do
    it "validates the presence of title"
    post = Post.new(title: nil)
    expect(post).to_not be_valid
    end
end