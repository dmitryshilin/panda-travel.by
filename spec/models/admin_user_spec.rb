require 'spec_helper'
require 'cancan/matchers'

describe AdminUser do
  describe 'abilities' do
    context 'when guest' do
      let(:user) { nil }
      subject(:bad_ability) { Ability.new(user) }
      it { should_not be_able_to(:manage, user) }
    end

    context 'when is an account manager' do
      let(:user) { FactoryGirl.build(:admin_user) }
      subject(:ability) { Ability.new(user) }
      it { should be_able_to(:manage, user) }
    end
  end
end
