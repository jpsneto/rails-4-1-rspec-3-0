class ActiveRecord::Base
  #mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.shared_connection
    @@shared_connection
  end

  def self.shared_connection=(shared_connection)
    @@shared_connecton = shared_connection
  end

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
