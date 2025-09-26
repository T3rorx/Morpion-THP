#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require 'morpion'
require 'morpion/board_case'
require 'morpion/board'
require 'morpion/player'
require 'morpion/show'
require 'morpion/game'
require 'morpion/application'

Application.new.run!
