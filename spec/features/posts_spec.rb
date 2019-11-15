require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  context "create new post" do
    before (:each) do
      sign_in FactoryGirl.create(:user)
    end
    scenario "should be successful" do
      visit 'posts/new'
      within('form') do
       fill_in 'Title', with: 'Hello Kitty'
       fill_in 'Body', with: 'jshgdvid'
      end
      expect{ click_button 'Submit' }.to change(Post, :count).by(1)
      expect(page).to have_content('Hello Kitty')
      expect(page).to have_content('jshgdvid')
    end

    scenario "should not be successful" do
      
      visit 'posts/new'
      within('form') do
       fill_in 'Title', with: ''
       fill_in 'Body', with: 'jshgdvid'
      end
      expect {click_button 'Submit'}.to change(Post, :count).by(0) 
      expect(page).to have_content('Title can\'t be blank')
    end
  end

  context "Delete a post "do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    before (:each) do
      sign_in user
    end
    
    scenario "Should delete the content" do
      visit post_path(post)
      expect{ click_link('Delete Post') }.to change(Post, :count).by(-1) 
    end
  end


  context "Update a content" do
    let(:user) {FactoryGirl.create(:user)}
    let(:post) {FactoryGirl.create(:post, user: user)}
    
    before (:each) do
      sign_in user
    end

    scenario "Update should be successful" do
      visit edit_post_path(post)
      within('form') do
        fill_in 'Title', with: 'Post1'
        fill_in 'Body', with: 'This is post one.'
      end
      click_button('Submit')
      expect(page).to have_content('Post1')
      expect(page).to have_content('This is post one.')
    end

    scenario "update should not be successful" do
      post=create(:post)
      visit edit_post_path(post)
      within('form') do
        fill_in 'Title', with: ''
        fill_in 'Body', with: 'This is post one.'
      end
      click_button('Submit')
      expect(current_path).to eq(post_path(post))
    end
  end
end
