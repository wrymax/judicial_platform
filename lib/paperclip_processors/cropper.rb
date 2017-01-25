# -*- encoding : utf-8 -*-
module Paperclip
  # Handles thumbnailing images that are uploaded.
  class Cropper < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      @file           = file
      @attachment     = attachment
      @options = options
    end

    def transformation_command
      if crop_command
        crop_command
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      if target.cropping?
        " -crop '#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}' "
      else
      end
    end
  end
end
