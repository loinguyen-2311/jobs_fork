class StringService
  def custom_normalize_string(string)
    string = string.mb_chars.unicode_normalize(:nfkd).gsub(/đ/, 'd').gsub(/Đ/, 'D').gsub(/[^\x00-\x7F]/n, '').gsub(
      /[^0-9A-Za-z -]/, ''
    ).downcase.to_s.squish
    string.gsub(%r{ }, '-').gsub(/-+/, '-')
  end

  def custom_string_parameterize(string)
    return if string.blank?

    remove_non_spacing_marks(string).parameterize
  end

  def remove_non_spacing_marks(string)
    string.strip.downcase.mb_chars
          .unicode_normalize(:nfkd)
          .gsub(/đ/, 'd')
          .gsub(/[.'&]/, '')
          .gsub(/_/, ' ')
          .gsub(/\p{Mn}/, '')
          .to_s.squish
  end

  def underscore_string(string)
    string = custom_normalize_string(string)
    string.downcase.gsub('-', '_')
  end

  def strip_tags(string)
    ActionController::Base.helpers.strip_tags(string)
  end

  def unicode_normalize(string)
    string.to_s.mb_chars.unicode_normalize(:nfkd).to_s
  end
end
