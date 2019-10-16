class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :sport, :trophies

  belongs_to :user
end
