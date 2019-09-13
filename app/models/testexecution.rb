class Testexecution < ApplicationRecord
  enum runstatus: {
    pending: 1,
    running: 2,
    completed: 3,
    error: 4,
    cancelled: 5,
    skipped: 6
  }
end
