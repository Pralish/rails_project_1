require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context "create new comment" do
    scenario "should be succesful" do
      post = create(:post)
      visit post_path(post)
      within('form') do
        fill_in 'User', with: 'pralish'
        fill_in 'Body', with: 'jshgdvid'
       end
       expect {click_button 'Create Comment'}.to change(Comment, :count).by(1) 
    end
  end
end
