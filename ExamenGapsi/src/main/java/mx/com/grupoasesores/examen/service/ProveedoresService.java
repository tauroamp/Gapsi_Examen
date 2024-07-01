package mx.com.grupoasesores.examen.service;

import mx.com.grupoasesores.examen.dto.ProveedorDto;

import java.util.List;


public interface ProveedoresService {

    List<ProveedorDto> getLlistProveedores();

    ProveedorDto addProveedor(String nombre);

    ProveedorDto deleteProveedor(ProveedorDto proveedorDto);

    ProveedorDto isPresentProveedor(ProveedorDto proveedorDto);
}
