class ContactPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end

# class NewsReleasePolicy < ApplicationPolicy
#   attr_reader :user, :news_release
#
#   #
#   # def initialize(user, news_release)
#   #   @user = user
#   #   @news_release = news_release
#   # end
#   #
#   # def new?
#   #   user.admin?
#   # end
#
#     def create?
#       user.admin?
#     end
#
#     def destroy?
#       user.admin?
#     end
#
# end
#
#
#
#
#
#
#
#
# # class NewsReleasePolicy < ApplicationPolicy
# #
# #   def create?
# #     user.admin?
# #   end
# #
# #   def destroy?
# #     user.admin?
# #   end
# #
# # end