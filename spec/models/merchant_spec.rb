require 'rails_helper'

RSpec.describe Merchant do

  describe "Relationships"
  it {should have_many :items}
  it {should have_many :invoices}
    describe 'Validations' do
    it {should validate_presence_of :name}
  end
end
