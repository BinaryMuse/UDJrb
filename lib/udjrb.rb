include Java
require File.expand_path "./udjrb/asjava.jar", File.dirname(__FILE__)

module UDJrb
  # Lazy-load the UniJava object
  def self.unijava
    @unijava = Java::asjava.uniobjects.UniJava.new if @unijava.nil?
    @unijava
  end

  class Session
    def initialize(user, pass, host, account)
      @session = unijava.open_session

      @session.set_user_name        user
      @session.set_password         pass
      @session.set_host_name        host
      @session.set_account_path     account
      @session.set_data_source_type "UNIDATA"

      @session.connect
    end

    def unijava
      UDJrb.unijava
    end

    def session
      @session
    end

    def disconnect
      unijava.close_session @session
    end

    def method_missing(method, args)
      @session.send method, args
    end
  end
end

class Java::AsjavaUniobjects::UniFile
  # Extension to make it easier to read data from a file.
  def data(field)
    self.read_named_field(field)
  end
end

class Java::AsjavaUniclientlibs::UniDynArray
  # Extension to treat UniDynArray as Enumerable.
  # Note that using each or any of the resulting methods
  # from Enumerable treats each element in the UniDynArray
  # as a string (to_s is called on each element extracted).
  include Enumerable
  def each
    0.upto count(1) do |n|
      yield self.extract(1, n+1).to_s
    end
  end
end
