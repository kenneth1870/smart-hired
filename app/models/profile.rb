# == Schema Information
#
# Table name: profiles
#
#  address_id  :bigint(8)
#  created_at  :datetime         not null
#  first_name  :string
#  grade_level :string
#  id          :bigint(8)        not null, primary key
#  last_name   :string
#  portfolio   :string
#  resume      :string
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_profiles_on_address_id  (address_id)
#  index_profiles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id) ON DELETE => nullify
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#

class Profile < ApplicationRecord
  mount_uploader :portfolio, AttachmentUploader
  mount_uploader :resume, AttachmentUploader
  belongs_to :user
  belongs_to :address

  has_many :skills, inverse_of: :profile

  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :address, reject_if: :all_blank

  def full_name
    "#{first_name} #{last_name}"
  end
end
