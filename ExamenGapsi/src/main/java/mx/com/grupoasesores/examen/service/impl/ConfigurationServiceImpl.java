package mx.com.grupoasesores.examen.service.impl;

import mx.com.grupoasesores.examen.service.ConfigurationService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ConfigurationServiceImpl implements ConfigurationService {

    final String WELCOME_MESSAGE = "Bienvenido Candidato 01";

    @Value("${app.version}")
    String version;


    @Override
    public String getVersion() {
        return "v".concat(version);
    }

    @Override
    public String getWelcomeMessage() {
        return WELCOME_MESSAGE;
    }
}
