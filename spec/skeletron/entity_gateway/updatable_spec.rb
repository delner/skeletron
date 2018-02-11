require 'spec_helper'

RSpec.describe Skeletron::EntityGateway::Updatable do
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
        describe '#update' do
          subject(:entity) { gateway.update(id: id, attributes: attributes) }
          let(:id) { 'foo' }
          let(:attributes) { { foo: 'bar' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end

        describe '#update_all' do
          subject(:entity) { gateway.update_all(by: by, with: with) }
          let(:by) { { id: 'foo' } }
          let(:with) { { foo: 'bar' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end
