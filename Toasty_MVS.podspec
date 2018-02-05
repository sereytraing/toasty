Pod::Spec.new do |s|
  s.name = 'Toasty_MVS'
  s.version = '2.2.0'
  s.license = 'MIT'
  s.summary = 'Avoir les toasts sur iOS'
  s.homepage = 'https://github.com/sereytraing/toasty'
  s.authors = { 'TRAING Sereypich' => 't.sereypich@gmail.com',
                'BOINET Maxime' => 'test@test.fr',
                'OFFROY Vincent' => 'test@test.fr'
              }
  s.source = { :git => 'https://github.com/sereytraing/toasty.git', :branch => "master", :tag => s.version }
  #s.ios.deployment_target = '8.0'
  s.platform = :ios, "11.0"
  s.source_files = 'Toasty/*.swift'
end
