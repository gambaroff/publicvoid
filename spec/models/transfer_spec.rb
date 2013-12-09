require 'spec_helper'

describe Transfer do

  let(:user) { FactoryGirl.create(:user) }
  before {
    file = File.new(Rails.root + 'spec/support/ico.png')  
    upload = ActionDispatch::Http::UploadedFile.new(:tempfile => file, :filename => File.basename(file))  
    @transfer = user.transfers.build(transfered_file: upload) 
  }

  subject { @transfer }

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
