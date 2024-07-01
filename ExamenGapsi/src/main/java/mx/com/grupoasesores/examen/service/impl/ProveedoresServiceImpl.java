package mx.com.grupoasesores.examen.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import mx.com.grupoasesores.examen.dto.ProveedorDto;
import mx.com.grupoasesores.examen.service.ProveedoresService;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


@Service
@Log4j2
public class ProveedoresServiceImpl implements ProveedoresService {


    private String getJsonStringFromFile() throws IOException {
        ClassPathResource resource = new ClassPathResource("bd.json");
        InputStream is = resource.getInputStream();
        return IOUtils.toString(is, StandardCharsets.UTF_8);
    }

    @Override
    public List<ProveedorDto> getLlistProveedores() {
        ArrayList<ProveedorDto> result = new ArrayList<>();
        /// Cargar archivo JSON
        ClassPathResource resource = new ClassPathResource("bd.json");
        try {
            ObjectMapper mapper = new ObjectMapper();
            result = mapper.readValue(this.getJsonStringFromFile(), ArrayList.class);
        } catch (IOException e) {
            log.error("Ocurrió un error al leer el archivo JSON.");
            log.error(e);
        }
        return result;
    }

    @Override
    public ProveedorDto addProveedor(String nombre) {
        ProveedorDto dto = new ProveedorDto();
        List<ProveedorDto> list = getLlistProveedores();

        ProveedorDto proveedor = list.stream().filter(data -> data.getNombre().equalsIgnoreCase(nombre)).toList().get(0);
        if (proveedor != null) list.remove(proveedor);

        return proveedor;
    }

    @Override
    public ProveedorDto deleteProveedor(ProveedorDto proveedorDto) {
        return null;
    }

    @Override
    public ProveedorDto isPresentProveedor(ProveedorDto proveedorDto) {
        return null;
    }
}
