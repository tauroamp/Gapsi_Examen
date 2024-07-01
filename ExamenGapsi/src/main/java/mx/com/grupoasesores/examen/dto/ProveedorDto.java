package mx.com.grupoasesores.examen.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProveedorDto implements Serializable {

    String nombre;
    String razonSocial;
    String direccion;

}
