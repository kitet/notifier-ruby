class Company< ActiveRecord::Base
    has_many :subscribers, through: :subscriptions
end