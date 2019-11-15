require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

    it { should use_before_action(:get_post) }
    it { should use_before_action(:authenticate_user!) }


    describe "DELETE #delete" do
        let!(:user) { FactoryGirl.create(:user) }
        let!(:post) { FactoryGirl.create(:post, user: user) }
        before (:each) do 
            sign_in user
        end
        
        it 'should delete post' do
            expect{delete 'destroy', { params: { id: post.id }}}.to change(Post, :count).by(-1)
            expect(response).to redirect_to(posts_path)
        end
    end

    
end
