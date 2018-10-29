# Silent Progress Bar

[![Gem Version](https://img.shields.io/gem/v/silent_progress_bar.svg)](https://rubygems.org/gems/silent_progress_bar)
[![Build Status](https://travis-ci.org/jfiander/silent-progress-bar.svg)](https://travis-ci.org/jfiander/silent-progress-bar)
[![Maintainability](https://api.codeclimate.com/v1/badges/4c8be06f11872994f2c7/maintainability)](https://codeclimate.com/github/jfiander/silent-progress-bar/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4c8be06f11872994f2c7/test_coverage)](https://codeclimate.com/github/jfiander/silent-progress-bar/test_coverage)

A simple progress bar wrapper that suppresses ActiveRecord logging.

## Installation

Add this to your Gemfile:

```ruby
gem 'silent_progress_bar'
```

Or manually install the gem:

```sh
gem install silent_progress_bar
```

## Usage

Create a progress bar, then pass a block into it.

You must pass the block an argument to allow incrementing the progress bar.

```ruby
progress = SilentProgressBar.new(count: 10)
progress.run do |bar|
  10.times { sleep 0.2; bar.increment }
end
```

You can also call `run` directly on the class.

```ruby
SilentProgressBar.run(count: 10) do |bar|
  10.times { sleep 0.2; bar.increment }
end
```
