require 'spec_helper'

describe AssetTransfer do
 let(:user) { FactoryGirl.create(:user) }
  before { @asset_transfer = user.asset_transfers.build(direct_upload_url: "https://s3.amazonaws.com/Composition-test/uploads%2F1372265204188-1ioaamlendoi-494d051f539a9b026debc599e1069cd5%2Fsloth.jpg") }

  subject { @asset_transfer }

  it { should respond_to(:direct_upload_url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @asset_transfer.user_id = nil }
    it { should_not be_valid }
  end
end
