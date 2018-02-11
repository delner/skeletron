require 'skeletron/entity_gateway'

module Skeletron
  module Null
    module EntityGateway
      def self.included(base)
        base.include(Skeletron::EntityGateway)
        base.extend(ClassMethods)
        base.include(InstanceMethods)
      end

      module ClassMethods
        def define_default_object(object = nil, &block)
          @default_object = object || block
        end

        def default_object
          return @default_object.call if @default_object.class <= Proc
          @default_object
        end
      end

      module InstanceMethods
        # Creatable
        def build(attributes = {})
          self.class.default_object.tap do |card|
            yield(card) if block_given?
          end
        end

        def create(attributes = {}, &block)
          build(attributes, &block)
        end

        # Readable
        def find(id)
          raise Skeletron::EntityGateway::NotFoundError.new(id)
        end

        def find_by_id(id)
          self.class.default_object
        end

        def find_all_by(attributes = {})
          []
        end

        # Updatable
        def update(id:, attributes: {})
          self.class.default_object
        end

        def update_all(by: {}, with: {})
          []
        end

        # Deletable
        def delete(id)
          true
        end

        def delete_all(attributes = {})
          0
        end
      end
    end
  end
end
