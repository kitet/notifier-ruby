class Subscription < ActiveRecord::Base
    belongs_to :company
    belongs_to :subscriber

    #scope :find_companies_of_subscriber, ->(@subscriber_id) { where(subscriber_id: subscriber_id)}
end