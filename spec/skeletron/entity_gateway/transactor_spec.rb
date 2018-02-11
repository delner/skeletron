require 'spec_helper'

RSpec.describe Skeletron::EntityGateway::Transactor do
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
        describe '#transaction' do
          subject(:result) { gateway.transaction(&block) }
          let(:block) { Proc.new { } }
          it { expect { result }.to raise_error(NotImplementedError) }
        end
      end
    end
  end
end
