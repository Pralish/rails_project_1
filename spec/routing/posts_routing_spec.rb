require 'rails_helper'

RSpec.describe "routing", :type => :routing do

        it "should route to index" do
            expect(:get => "/").to route_to(:controller => "posts", :action => 'index')
        end

        # it {should route(:get, "/").to(:controller => "posts", :action => "index") }

        it {should route(:get, "/posts/new").to(controller: :posts, action: :new)}

        it {should route(:get, "/posts/1").to(controller: :posts, action: :show, id: 1)}

        it {should route(:get, "/posts/1/edit").to("posts#edit", id: 1)}

        it do
            should route(:delete, "posts/1").to("posts#destroy", id: 1)
        end

        it {should route(:patch, "posts/1").to("posts#update", id: 1)}


        

end
