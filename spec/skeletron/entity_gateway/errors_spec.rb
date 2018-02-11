require 'spec_helper'
require 'securerandom'

RSpec.describe Skeletron::EntityGateway::NotFoundError do
  describe 'instance' do
    subject(:error) { described_class.new(id) }
    let(:id) { SecureRandom.uuid }

    describe 'behavior' do
      it { is_expected.to be_a_kind_of(StandardError) }

      describe '#message' do
        subject(:message) { error.message }

        it { is_expected.to be_a_kind_of(String) }
        it { is_expected.to include(id) }
      end
    end
  end
end
