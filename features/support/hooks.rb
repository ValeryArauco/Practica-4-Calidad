
After do 
  Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

# Captura de pantalla en caso de error
After do |scenario|
  begin
    if scenario.failed?
      FileUtils.mkdir_p('capturas-errores') unless File.directory?('capturas-errores')

      timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
      screenshot_name = "./capturas-errores/#{scenario.name}_#{timestamp}.png"

      screenshot = page.save_screenshot(screenshot_name)
      attach(screenshot, 'image/png')
      puts "Error en el escenario: #{scenario.name}, Captura guardada con #{screenshot_name}"
    end
  rescue StandardError => e
    puts "Error al capturar pantalla: #{e.message}"
  end
end

# Modulo Tiempo transcurrido
module ExecutionTimer
  @scenario_times = {}

  def self.start(scenario)
    @scenario_times[scenario.name] = {
      start_time: Process.clock_gettime(Process::CLOCK_MONOTONIC),
      scenario: scenario
    }
  end

  def self.elapsed_time(scenario)
    # Buscar por el nombre del escenario
    scenario_data = @scenario_times.delete(scenario.name)
    
    if scenario_data
      start_time = scenario_data[:start_time]
      (Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time).round(2)
    else
      0
    end
  end

  def self.log_scenario_time(scenario)
    tiempo = elapsed_time(scenario)
    estado = scenario.failed? ? "❌ FALLIDO" : "✅ EXITOSO"
    
    puts "📋 Escenario: #{scenario.name}"
    puts "⏱️  Tiempo: #{tiempo} seg"
    puts "🗣️  Resultado: #{estado}"
  end
end

# Hook para medir tiempo de ejecución
Before do |scenario|
  ExecutionTimer.start(scenario)
end

After do |scenario|
  ExecutionTimer.log_scenario_time(scenario)
end