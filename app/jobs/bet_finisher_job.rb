class BetFinisherJob < ApplicationJob
  queue_as :default

  def perform(bet)
    bet.finish_bet
  end
end
