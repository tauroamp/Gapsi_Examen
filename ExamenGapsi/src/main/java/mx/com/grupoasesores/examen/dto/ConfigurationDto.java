package mx.com.grupoasesores.examen.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/**
 * Envío de versión y mensaje
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ConfigurationDto {
    String version;
    String welcomeMessage;
}
