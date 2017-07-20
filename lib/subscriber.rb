class Subscriber <ActiveRecord::Base
    has_many :companies, through: :subscriptions
end