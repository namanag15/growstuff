class Seed < ActiveRecord::Base
  extend FriendlyId
  include PhotoCapable
  friendly_id :seed_slug, use: [:slugged, :finders]

  belongs_to :crop
  belongs_to :owner, class_name: 'Member', foreign_key: 'owner_id', counter_cache: true

  default_scope { joins(:owner).order(created_at: :desc) }

  validates :crop, approved: true
  delegate :name, to: :crop
  delegate :default_photo, to: :crop

  validates :crop, presence: { message: "must be present and exist in our database" }
  validates :quantity,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    },
    allow_nil: true
  validates :days_until_maturity_min,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    },
    allow_nil: true
  validates :days_until_maturity_max,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    },
    allow_nil: true

  scope :tradable, -> { where.not(tradable_to: 'nowhere') }
  scope :interesting, -> { tradable.has_location }
  scope :has_location, -> { joins(:owner).where.not("members.location": nil) }
  TRADABLE_TO_VALUES = %w(nowhere locally nationally internationally).freeze
  validates :tradable_to, inclusion: { in: TRADABLE_TO_VALUES,
                                       message: "You may only trade seed nowhere, "\
                                                "locally, nationally, or internationally" },
                          allow_nil: false,
                          allow_blank: false

  ORGANIC_VALUES = [
    'certified organic',
    'non-certified organic',
    'conventional/non-organic',
    'unknown'
  ].freeze
  validates :organic, inclusion: { in: ORGANIC_VALUES,
                                   message: "You must say whether the seeds "\
                                             "are organic or not, or that you don't know" },
                      allow_nil: false,
                      allow_blank: false

  GMO_VALUES = [
    'certified GMO-free',
    'non-certified GMO-free',
    'GMO',
    'unknown'
  ].freeze
  validates :gmo, inclusion: { in: GMO_VALUES,
                               message: "You must say whether the seeds are "\
                                        "genetically modified or not, or that you don't know" },
                  allow_nil: false,
                  allow_blank: false

  HEIRLOOM_VALUES = %w(heirloom hybrid unknown).freeze
  validates :heirloom, inclusion: { in: HEIRLOOM_VALUES,
                                    message: "You must say whether the seeds are heirloom, hybrid, or unknown" },
                       allow_nil: false,
                       allow_blank: false

  def tradable?
    if tradable_to == 'nowhere'
      false
    else
      true
    end
  end

  def seed_slug
    "#{owner.login_name}-#{crop}".downcase.tr(' ', '-')
  end

  def to_s
    I18n.t('seeds.string', crop: crop.name, owner: owner)
  end
end
