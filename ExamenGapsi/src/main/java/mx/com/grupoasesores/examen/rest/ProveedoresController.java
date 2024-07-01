package mx.com.grupoasesores.examen.rest;


import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import mx.com.grupoasesores.examen.service.ProveedoresService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Getter
@Setter
@Log4j2
@RequestMapping("/proveedores")
public class ProveedoresController {


    final ProveedoresService proveedoresService;

    public ProveedoresController(ProveedoresService proveedoresService) {
        this.proveedoresService = proveedoresService;
    }


    @PostMapping(value = "/list", produces = "application/json")
    public ResponseEntity<?> listProveedores() {
//            @RequestParam("page") Integer page,
//                                             @RequestParam("start") Integer start,
//                                             @RequestParam("limit") Integer limit) {


        return ResponseEntity.ok().body(proveedoresService.getLlistProveedores());
    }
}
