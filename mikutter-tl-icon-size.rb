# -*- coding: utf-8 -*-

Plugin.create :tl_icon_size do
  UserConfig[:tl_icon_size] ||= 64

  module Gdk::Coordinate
    def coordinator_ex(width)
      @width, @color, @icon_width, @icon_height, @icon_margin = [width, 1].max, DEPTH, UserConfig[:tl_icon_size], UserConfig[:tl_icon_size], 2
    end

    alias_method :coordinator_org, :coordinator
    alias_method :coordinator, :coordinator_ex
  end

  settings "TLのアイコンサイズ" do
      adjustment("アイコンサイズ", :tl_icon_size, 1, 100)
  end
end
