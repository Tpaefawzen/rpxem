require 'rpxem/interpreter'
require 'rpxem/version'

module RPxem
  class << self
    def new(options={}, encoding="binary")
      RPxem::Interpreter.new(options, encoding)
    end

  private
    def method_missing(name, *args, &block)
      return super unless new.respond_to?(name)
      new.__send__(name, *args, &block)
    end

    def respond_to?(name)
      new.respond_to?(name) || super(name)
    end
  end
end
