module ApplicationHelper
  def show_meta_tags
    assign_meta_tags if display_meta_tags.blank?
    display_meta_tags
  end

  def default_meta_tags
    def default_meta_tags
    {
      site: 'zenfocus',
      title: '集中できる静かな場所を探す',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: '勉強や作業に最適な静かな場所を簡単に見つけられるサービスです。',
      keywords: '静かな場所, 勉強, 作業, カフェ, 図書館, zenfocus',   #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'zenfocus',
        title: '集中できる静かな場所を探す | zenfocus',
        description: '勉強や作業にぴったりな静かな場所を地図検索で簡単に探せるサービスです。', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
      }
    }
  end
  end
end

