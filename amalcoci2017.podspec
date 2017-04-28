#
# Be sure to run `pod lib lint amalcoci2017.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'amalcoci2017'
  s.version          = '1.0.0'
  s.summary          = 'Day08 of amalcoci.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Maintenant que vous avez découvert les pods nous allons apprendre à en créer un.
Toujours grace à Cocoapods! Si vous avez déjà oublié ce qu’est un pod c’est un
paquet qui est donc géré par un gestionnaire de paquets ici Cocoapods.
L’objectif de la journée sera d’en créer un qui utilisera le framework CoreData
pour apprendre a utiliser la persistance des données et les modeles.
Le but de la journée étant de créer un gestionaire d’articles qui servira d’interface
pour le D09.
Voici les documentations dont vous aurez besoin pour finir la journée :
    • Doc Cocoapods
    • CoreData
                       DESC

  s.homepage         = 'https://github.com/compandreimd/amalcoci2017'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'compandreimd' => 'compandreimd@gmail.com' }
  s.source           = { :git => 'https://github.com/compandreimd/amalcoci2017.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'amalcoci2017/Classes/**/*.swift'
  s.resource_bundles = {
    'amalcoci2017' => ['amalcoci2017/Classes/*.xcdatamodeld']
  }
  # s.resource_bundles = {
  #   'amalcoci2017' => ['amalcoci2017/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
