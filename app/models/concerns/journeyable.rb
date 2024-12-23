# frozen_string_literal: true

module Journeyable # rubocop:todo Style/Documentation
  extend ::ActiveSupport::Concern

  included do
    has_many :journey_items, as: :journeyable, class_name: 'JourneyItem'
    has_many :journeys, through: :journey_items, class_name: 'Journey'

    def journeyable?
      case self.class.name
      when 'BetterTogether::Content::Hero',
           'BetterTogether::Content::Css',
           'JourneyMap'
        false
      else
        true
      end
    end
  end
end
