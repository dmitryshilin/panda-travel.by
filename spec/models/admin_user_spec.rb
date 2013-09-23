require 'spec_helper'
require 'cancan/matchers'

describe AdminUser do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }

    let(:user) { nil }

    # context 'when guest' do
    #   bad_ability = Ability.new(nil)
    #   it { should_not be_able_to(:manage, AdminUser.new) }
    # end


    context "when is an account manager" do
      let(:user){ FactoryGirl.build(:accounts_manager) }
      it { should be_able_to(:manage, AdminUser.new) }
    end
  end
end
