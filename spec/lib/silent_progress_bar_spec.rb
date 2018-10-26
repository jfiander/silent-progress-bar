# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SilentProgressBar do
  it 'should output a progress bar from .run' do
    expect do
      SilentProgressBar.run(title: 'Testing 1', count: 5) do |bar|
        5.times { bar.increment }
      end
    end.to output(/Testing 1/).to_stdout_from_any_process
  end

  it 'should output a progress bar from #run' do
    expect do
      bar = SilentProgressBar.new(title: 'Testing 2', count: 5)

      bar.run do |b|
        5.times { b.increment }
      end
    end.to output(/Testing 2/).to_stdout_from_any_process
  end

  it 'should return the final value' do
    progress = SilentProgressBar.run(title: 'Testing 3', count: 5) do |b|
      5.times { b.increment }
      :result
    end

    expect(progress).to eql(:result)
  end

  it 'should not output extra logging' do
    expect do
      SilentProgressBar.run(title: 'Testing 3', count: 5) do |b|
        puts 'Bad log'
        5.times { b.increment }
      end
    end.not_to output('Bad log').to_stdout_from_any_process
  end
end
