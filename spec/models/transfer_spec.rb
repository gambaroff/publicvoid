require 'spec_helper'

describe Transfer do

  let(:user) { FactoryGirl.create(:user) }
  before { @transfer = user.transfers.build(content: "Lorem_ipsum.mov") }

  subject { @transfer }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @transfer.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @transfer.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @transfer.content = "a" * 141 }
    it { should_not be_valid }
  end
end