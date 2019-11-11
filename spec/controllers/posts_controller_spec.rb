require 'rails_helper'

RSpec.describe PostsController do

    describe "POST #create" do
 
        context "with valid params" do
            it "should  create  post " do
                expect{ post 'create', :params => { post: FactoryGirl.attributes_for(:post)  }}.to change(Post, :count).by(1)
                expect(response.status).to eq(302)
            end

            it {should permit(:title, :body).for(:create, :params => { post: { title: "name", body: "Test"}  } )}
        end          
    end

    describe "DELETE #delete" do
        it 'should delete' do
            # @post = Post.create(title: "name", body: "Test")
            @post = create(:post)
            expect{delete 'destroy',  { params: { id: @post.id }}}.to change(Post, :count).by(-1)
           expect(response).to redirect_to(welcome_index_path)
        end
    end

end
