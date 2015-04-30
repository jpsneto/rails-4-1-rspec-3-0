class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_activities
    @user.roles.select(:activities).distinct.map(&:activities).flatten
  end

  def inferred_activity(method)
    "#{@record.class.name.downcase}:#{method.to_s}"
  end

  def method_missing(name,*args)
    if name.to_s.last == '?'
      user_activities.include?(inferred_activity(name.to_s.gsub('?','')))
    else
      super
    end
  end


  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

# class ApplicationPolicy
#   attr_reader :user, :record
#
#   def initialize(user, record)
#     @user = user
#     @record = record
#   end
#
#   def index?
#     false
#   end
#
#   def show?
#     scope.where(:id => record.id).exists?
#   end
#
#   def create?
#     false
#   end
#
#   def new?
#     create?
#   end
#
#   def update?
#     false
#   end
#
#   def edit?
#     update?
#   end
#
#   def destroy?
#     false
#   end
#
#   def scope
#     Pundit.policy_scope!(user, record.class)
#   end
#
#   class Scope
#     attr_reader :user, :scope
#
#     def initialize(user, scope)
#       @user = user
#       @scope = scope
#     end
#
#     def resolve
#       scope
#     end
#   end
# end
