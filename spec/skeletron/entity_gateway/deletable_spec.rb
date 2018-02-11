require 'spec_helper'

RSpec.describe Skeletron::EntityGateway::Deletable do
  subject { described_class }

  describe 'implemented' do
    let(:test_class) do
      Class.new.tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'instance' do
      subject(:gateway) { test_class.new }

      describe 'behavior' do
        describe '#delete' do
          subject(:entity) { gateway.delete(id) }
          let(:id) { 'foo' }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end

        describe '#delete_all' do
          subject(:entity) { gateway.delete_all(attributes) }
          let(:attributes) { { id: 'foo' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end
