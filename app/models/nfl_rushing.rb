class NflRushing < ActiveRecord::Base
  def self.to_csv(results)
    attributes = [
      :player, :team, :pos, :att, :att_g, :yds, :avg, :yds_g, :td, 
      :lng, :first_down, :first_down_percent, :yards_20, :yards_40, :fum
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes
      results.each do |nfl_rushing|
        csv << attributes.map{ |attr| nfl_rushing.send(attr) }
      end
      csv
    end
  end

  # This would be replaced with a real feed import
  def self.import_data
    mappings = {
      :player => "Player",
      :team => "Team",
      :pos => "Pos",
      :att => "Att",
      :att_g => "Att/G",
      :yds => "Yds",
      :avg => "Avg",
      :yds_g => "Yds/G",
      :td => "TD",
      :lng => "Lng",
      :first_down => "1st",
      :first_down_percent => "1st%",
      :yards_20 => "20+",
      :yards_40 => "40+",
      :fum => "FUM"
    }
    
    file = File.read(Rails.root.join('rushing.json'))
    data_hash = JSON.parse(file)
    data_hash.each do |data|
      results = mappings.inject({}){|h, (k, v)| h[k] = data[v]; h}
      NflRushing.create!(results)
    end
  end
end