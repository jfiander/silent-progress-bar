# frozen_string_literal: true

require 'active_record'
require 'ruby-progressbar'

# Suppresses output and displays a progress bar
class SilentProgressBar
  attr_reader :progress_bar

  def initialize(title: 'Progress', count: 1)
    @title = title
    @count = count
    @progress_bar = create_progress_bar
  end

  def self.run(title: 'Progress', count: 1)
    bar = new(title: title, count: count)

    bar.run { yield(bar.progress_bar) }
  end

  def self.no_logging
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
    result = yield
    ActiveRecord::Base.logger = old_logger
    result
  end

  def run
    self.class.no_logging { yield(progress_bar) }
  end

  def create_progress_bar
    ProgressBar.create(
      title: @title, starting_at: 0, format: "%a %b\u{15E7}%i %p%% %t",
      total: @count, progress_mark: ' ', remainder_mark: "\u{FF65}"
    )
  end
end
