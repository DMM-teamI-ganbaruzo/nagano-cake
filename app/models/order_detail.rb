class OrderDetail < ApplicationRecord

enum production_status: { cannot_start: 0, waiting_production: 1, creating_production: 2, finish_production: 3 }

end
