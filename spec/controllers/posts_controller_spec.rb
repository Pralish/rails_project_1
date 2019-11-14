require 'rails_helper'

RSpec.describe PostsController do


    # describe "POST #create" do
    #     let!(:invalid_post) { FactoryGirl.attributes_for(:invalid_post)  }
    #     let!(:valid_post) { FactoryGirl.attributes_for(:post)  }

    #     context "with valid params" do
    #         it "should  create new post" do
    #             post :create,  params: { post:  valid_post } 
    #             expect(Post.all.count).to eq(1)
    #         end

    #     end     
        
    #     context "with invalid params" do
    #         it "should not create new post" do
    #          post :create,  params: { post:  invalid_post } 
    #         end
    #     end
    # end


    describe "DELETE #delete" do
        it 'should delete' do
            # @post = Post.create(title: "name", body: "Test")
            @post = create(:post)
            expect{delete 'destroy',  { params: { id: @post.id }}}.to change(Post, :count).by(-1)
           expect(response).to redirect_to(posts_path)
        end
    end

    
end
