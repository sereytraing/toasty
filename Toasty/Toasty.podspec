Pod::Spec.new do |s|
  s.name = 'Toasty'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Avoir les toasts sur iOS'
  s.homepage = 'https://github.com/sereytraing/toasty'
  s.authors = { 'TRAING Sereypich' => 't.sereypich@gmail.com',
                'BOINET Maxime' => 'test@test.fr',
                'OFFROY Vincent' => 'test@test.fr'
              }
  s.source = { :git => 'https://github.com/sereytraing/toasty.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Toasty/*.swift'
end
