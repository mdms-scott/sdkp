namespace :db do
  desc "Prepare the item database and create an admin user"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_user
    make_items
  end
end

def make_user
  User.create!(:name => "Admin",
               :password => "password",
               :password_confirmation => "password")
end

def make_items
  
  def halfus_wyrmbreaker(name, itemid, heroicid)
    Item.create!(:name => name,
                 :boss => "Halfus Wyrmbreaker"
                 :itemid => itemid,
                 :heroicid => heroicid)
  end
  
  halfus_wyrmbreaker("Wyrmbreaker's Amulet", "59483", "65134")
  halfus_wyrmbreaker("Book of Binding Will", "59484", "65133")
  halfus_wyrmbreaker("Essence of the Cyclone", "59473", "65140")
  halfus_wyrmbreaker("Bracers of the Bronze Flight", "59475", "65138")
  halfus_wyrmbreaker("Proto-Handler's Gauntlets", "59472", "65141")
  halfus_wyrmbreaker("Bracers of Impossible Strength", "59470", "65143")
  halfus_wyrmbreaker("Pauldrons of the Great Ettin", "59471", "65142")
  halfus_wyrmbreaker("Malevolence", "59474", "65139")
  halfus_wyrmbreaker("Legguards of the Emerald Brood", "59476", "65137")
  halfus_wyrmbreaker("Robes of the Burning Acolyte", "59482", "65135")
  halfus_wyrmbreaker("Helm of the Nether Scion", "59481", "65136")
  halfus_wyrmbreaker("Storm Rider's Boots", "59469", "65144")
  
  
end