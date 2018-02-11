require 'spec_helper'

RSpec.describe Skeletron::EntityGateway::Creatable do
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
        describe '#build' do
          subject(:entity) { gateway.build(attributes) }
          let(:attributes) { { foo: 'bar' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end

        describe '#create' do
          subject(:entity) { gateway.create(attributes) }
          let(:attributes) { { foo: 'bar' } }

          it { expect { entity }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end
