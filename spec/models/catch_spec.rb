require 'rails_helper'

RSpec.describe Catch, type: :model do
  describe '#self.generate_code' do
    it 'returns a 6 digit alpha numeric code' do
      code = Catch.generate_code

      expect(code).to be_present
      expect(code.length).to eq(6)
      expect(code).to match(/[A-Z0-9]{6}/)
    end
  end
end
