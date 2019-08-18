require 'rails_helper'

RSpec.describe Invoice do
  describe 'Relationships' do
    it {should have_many :invoice_items}
    it {should have_many :transactions}
    it {should have_many :items}
    it {should belong_to :merchant}
    it {should belong_to :customer}
  end

  describe 'Validations' do
    it {should validate_presence_of :status}
  end
end
