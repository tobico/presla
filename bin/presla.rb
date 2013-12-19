#!/usr/bin/env ruby

require 'bundler'
Bundler.require
require_relative '../lib/presla'

Presla::App.new(ARGV.first).run
