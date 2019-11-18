require 'rails_helper'

describe PostPolicy do
    subject { PostPolicy.new(user, post) }
  
    
  
    context "for a visitor" do
      let(:user) { nil }
      let(:post) { FactoryGirl.create(:post) }
  
      it { should permit_action(:show)}
      it { should forbid_action(:create)  }
      it { should forbid_action(:new)     }
      it { should forbid_action(:update)  }
      it { should forbid_action(:edit)    }
      it { should forbid_action(:destroy) }
    end

    context "for a user" do
        let(:user) {FactoryGirl.create(:user, FactoryGirl.attributes_for(:user))}
        let(:post) { FactoryGirl.create(:post, user: user) }
  
        it { should permit_action(:show)    }
        it { should permit_action(:create)  }
        it { should permit_action(:new)     }
        it { should permit_action(:update)  }
        it { should permit_action(:edit)    }
        it { should permit_action(:destroy) }
  end

    context "for a user" do
        let(:post) { FactoryGirl.create(:post) }
        let(:user) {FactoryGirl.create(:user, FactoryGirl.attributes_for(:user, role: 'admin'))}
        
        it { should permit_action(:show)    } 
        it { should forbid_action(:update)  }
        it { should forbid_action(:edit)    }
        it { should permit_action(:destroy) }
    end
end