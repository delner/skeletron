require 'spec_helper'

RSpec.describe Skeletron::Entity::Relatable do
  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", Class.new).tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'class' do
      subject(:relationship) { test_class }

      describe 'behavior' do
        describe '#associates' do
          subject(:associates) { relationship.associates }

          context 'when no definition given' do
            it { is_expected.to eq([]) }
          end

          context 'when definition given' do
            let(:definition) { [:foo, :bar] }
            before(:each) { relationship.define_associates(*definition) }
            it { is_expected.to eq(definition) }
          end
        end
      end
    end

    describe 'instance' do
      subject(:relationship) { test_class.new }

      describe 'behavior' do
        describe 'relationship attr_accessors' do
          before(:each) { test_class.define_associates(*definition) }
          let(:definition) { [:foo, :bar] }

          it do
            definition.each do |associate|
              expect(relationship).to respond_to(associate)
              expect(relationship).to respond_to("#{associate}=".to_sym)
            end
          end
        end
      end
    end
  end
end
