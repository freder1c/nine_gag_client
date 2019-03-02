module NineGag
  module Model
    class Base
      def initialize(params = {})
        attributes.each do |key, _|
          instance_variable_set("@#{key}", params[key.to_sym])
        end
      end

      def self.initialize_attributes(vars)
        @attributes ||= []
        @attributes.concat(vars)
      end

      def self.attr_accessor(*vars)
        initialize_attributes(vars)
        super(*vars)
      end

      def self.attributes
        @attributes
      end

      def attributes
        Hash[self.class.attributes.map { |key| [key.to_sym, send(key)] }]
      end
    end
  end
end
