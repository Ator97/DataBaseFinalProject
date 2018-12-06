--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creacion de indices

--indice unique.
-- CREATE UNIQUE INDEX PROFESOR_RFC_IUX ON PROFESOR(RFC); --Se indexa automaticamente al crear la tabla

CREATE UNIQUE INDEX TESIS_FECHA_REGISTRO_IUX ON TESIS(FECHA_REGISTRO);

-- CREATE UNIQUE INDEX TESIS_HIS_ID_IUX ON TESIS_HISTORICO(TESIS_ID); --No tiene sentido la creacion de este indice

-- CREATE UNIQUE INDEX ESTUDIANTE_NUM_CUENTA_IUX ON ESTUDIANTE(NUMERO_CUENTA); --Se indexa automaticamente al crear la tabla


--indice basados en funciones.
CREATE UNIQUE INDEX CARRERA_NOMBRE_IUX ON CARRERA(UPPER(NOMBRE));

CREATE UNIQUE INDEX PROFESOR_NOMBRE_IUX ON PROFESOR(UPPER(NOMBRE));

-- CREATE UNIQUE INDEX ESTUDIANTE_NOMBRE_IUX ON ESTUDIANTE(UPPER(NOMBRE)); --No tiene sentido, ¿porque no querria number iguales?

--indices compuestos
--
--Se pondrán  según se necesiten.
--