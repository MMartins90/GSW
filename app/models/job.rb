class Job < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_job_and_sector_and_salary,
        against: [ :job, :sector, :salary ],
        using: {
            tsearch: { prefix: true } # <-- incomplete search query will return something, hopefully.
        }
end
