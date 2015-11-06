class User < ActiveRecord::Base
  has_many :dogs, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_secure_password
end