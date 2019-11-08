require 'rails_helper'

RSpec.describe Post , :type => :model do
    it 'validates the presence of title' do
        post = Post.new(:title => nil)
        expect(post).to_not be_valid
    end
end