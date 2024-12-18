module ApplicationHelper
  def show_meta_tags
    assign_meta_tags if display_meta_tags.blank?
    display_meta_tags
  end
    
  def assign_meta_tags(options = {})
    defaults = {
      site: 'サイト名',
      title: 'デフォルトのタイトル',
      description: 'デフォルトのページの説明',
      keywords: 'デフォルトのページキーワード',
      image: image_url('logo.png') # デフォルト画像
    }
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    image = options[:image].presence || image_url('logo.png')
    configs = {
      separator: '|',
      reverse: true,
      site:,
      title:,
      description:,
      keywords:,
      canonical: request.original_url,
      icon: {
        href: image_url('logo.png')
        },
      og: {
        type: 'website',
        title: title.presence || site,
        description: nil,  # OGPのdescriptionは空にする
        url: request.original_url,
        image:,
        site_name: site
        },
      twitter: {
        site:,
        card: 'summary_large_image',
        image:
         }
    }
      set_meta_tags(configs)
  end
end

