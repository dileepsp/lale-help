class Supply::Notifications::CompletionReminderEmail < Mutations::Command
  required do
    model :supply
  end

  def execute
    [supply.volunteer].compact.each do |user|
      next unless user.email.present?
      token = Token.supply_completion.create! context: { user_id: user.id, supply_id: supply.id }
      SupplyMailer.delay.supply_completion_reminder(supply, user, token)
    end
  end
end
