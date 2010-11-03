rails rails_cerberus 
cd rails_cerberus
script/rails generate scaffold Card user:string nick:string after_hours:string expires:date valid_from:date disabled:string magic:string
script/rails generate scaffold Door name:string default_unlocked:string
script/rails generate scaffold AccessLog logged:datetime door:string action:string detail:string
