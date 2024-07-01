package mx.com.grupoasesores.examen.rest;


import lombok.extern.log4j.Log4j2;
import mx.com.grupoasesores.examen.dto.ConfigurationDto;
import mx.com.grupoasesores.examen.service.ConfigurationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Log4j2
public class ConfigurationController {


    final ConfigurationService configurationService;

    public ConfigurationController(ConfigurationService configurationService) {
        this.configurationService = configurationService;
    }


    @PostMapping(value = "/configuration")
    public @ResponseBody ResponseEntity<ConfigurationDto> getConfigurationData() {
        log.info("Entrando en '/configuration'.");
        ConfigurationDto dto = new ConfigurationDto();
        dto.setVersion(configurationService.getVersion());
        dto.setWelcomeMessage(configurationService.getWelcomeMessage());

        log.info("Saliendo de '/configuration'.");


        return ResponseEntity.ok().body(dto);

    }

}
