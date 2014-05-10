desc 'test project'
define 'buildr-jacoco' do
  project.group = 'org.realityforge.buildr.jacoco'
  project.version = '0.1'

  compile.options.source = '1.7'
  compile.options.target = '1.7'
  compile.options.lint = 'all'

  define 'a' do
    test.using :testng
  end

  define 'b' do
    test.using :integration
    test.using :testng

    integration.setup { selenium.run }
    integration.teardown { selenium.stop }
  end

  jacoco.generate_xml = true
  jacoco.generate_html = true
end
