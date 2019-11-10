require 'rails_helper'

RSpec.describe PostsController do

#   describe "GET #index" do
#     # it "should return all posts" do
#     #     get :index
#     # end
#   end

    describe "POST #create" do
 
        context "with valid params" do
            it "should  create  post " do
                post :create, :params => { post: { title: "name", body: "Test" }  }
            end

        end

        # context "with invalid params" do
        #     it "should not create post" do
        #         post :create, :params => { post: { title: "", body: "Test"} }
        #         expect(response).to render_templete(:new)
        #     end
        # end
    end


end
