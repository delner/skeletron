require 'spec_helper'
require 'skeletron/null/entity_gateway/transactor'

RSpec.describe Skeletron::Null::EntityGateway::Transactor do
  describe 'instance' do
    subject(:transactor) { described_class.new }

    describe 'behavior' do
      it { is_expected.to be_a_kind_of(Skeletron::EntityGateway::Transactor) }

      describe '#transaction' do
        it { expect { |b| transactor.transaction(&b) }.to yield_control }
      end
    end
  end
end
