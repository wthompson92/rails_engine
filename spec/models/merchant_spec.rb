require 'rails_helper'

RSpec.describe Merchant do
    describe 'Validations' do
    it {should validate_presence_of :name}
  end
end
