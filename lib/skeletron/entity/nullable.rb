module Skeletron
  module Entity
    module Nullable
      def self.included(base)
        base.extend(ClassMethods)
        base.include(InstanceMethods)
      end

      module ClassMethods
        def define_null_object(&block)
          unless defined?(self::Null)
            null_class = generate_null_object_class(&block)
            const_set(:Null, null_class.new)
          end
        end

        private

        def generate_null_object_class(&block)
          Class.new(self) do
            def initialize(**args)
              # Do nothing
            end

            def null_object?
              true
            end

            instance_exec(&block) if block
          end
        end
      end

      module InstanceMethods
        def null_object?
          false
        end
      end
    end
  end
end
