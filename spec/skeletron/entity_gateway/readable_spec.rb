require 'spec_helper'

RSpec.describe Skeletron::EntityGateway::Readable do
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
        describe '#find' do
          subject(:entity) { gateway.find(id) }
          let(:id) { 'foo' }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end

        describe '#find_by_id' do
          subject(:entity) { gateway.find_by_id(id) }
          let(:id) { 'foo' }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end

        describe '#find_all_by' do
          subject(:entity) { gateway.find_all_by(attributes) }
          let(:attributes) { { foo: 'bar' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end
