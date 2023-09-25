class Generator::CommissionService
  COMMISSION_RANGES = (10_000_000..20_000_000).step(1_000_000).map { |n| "#{n} VND" }
  def self.commission
    COMMISSION_RANGES.sample
  end
end
