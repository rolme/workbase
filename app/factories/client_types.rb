module Factory
  class ClientTypes
    CLIENT_LABELS = %w(lead prospect qualified potential customer)

    def initialize(company)
      @company = company
    end

    def generate_defaults!
      CLIENT_LABELS.each do |client_label|
        @company.client_types.create(label: client_label)
      end
    end
  end
end