require ("pry-byebug")
require_relative("models/bounty")

Bounty.delete_all()
binding.pry

bounty1 = Bounty.new({
  "name" => "Raphael",
  "species" => "human",
  "bounty_value" => "250",
  "danger_level" => "low"
  })

bounty2 = Bounty.new({
  "name" => "Tony",
  "species" => "latin",
  "bounty_value" => "15000",
  "danger_level" => "high"
  })

bounty1.save()

bounties_list = Bounty.all()

binding.pry
nil
