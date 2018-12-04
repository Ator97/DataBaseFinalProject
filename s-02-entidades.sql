--@autor(es): Gutiérrez Castillo Oscar, VAlderrama Navarro Armando
--@fecha creación: 01/12/2018
--@descripción:  Creacion de tablas

CREATE TABLE DIA_SEMANA( --CATALOGO DIAS DE LA SEMANA
  DIA_SEMANA_ID NUMBER(1)     NOT NULL,
  DESCRIPCION   VARCHAR2(10)  NOT NULL,
  CONSTRAINT PK_DIA_SEMANA PRIMARY KEY (DIA_SEMANA_ID),
  CONSTRAINT CHK_DIA_SEMANA_ID
  CHECK (DIA_SEMANA_ID BETWEEN 1 AND 6) --LUNES A SÁBADO
);

CREATE TABLE STATUS_TESIS(  --CATALOGO DE ESTATUS DE TESIS
  -- REGISTRADA,VALIDADA, CONCLUIDA CANCELADA,CON_CEDULA
  STATUS_TESIS_ID NUMBER(1,0)   NOT NULL,
  CLAVE           VARCHAR2(11)  NOT NULL,
  DESCRIPCION     VARCHAR2(55)  NOT NULL,
  CONSTRAINT PK_STATUS_TESIS PRIMARY KEY (STATUS_TESIS_ID)
);

CREATE TABLE CARRERA( --CATALOGO DE CARRERAS
  CARRERA_ID  NUMBER(2,0)   NOT NULL,
  NOMBRE      VARCHAR2(50)  NOT NULL,
  CLAVE       NUMBER(3,0)   NOT NULL,
  DESCRIPCION VARCHAR2(150) NOT NULL,
  CONSTRAINT PK_CARRERA_CARRERA PRIMARY KEY (CARRERA_ID),
  CONSTRAINT UK_CARRERA_NOMBRE UNIQUE (NOMBRE)
)
;

CREATE TABLE PLAN_ESTUDIOS( --CATALOGO DE PLAN DE ESTUDIOS
  PLAN_ESTUDIOS_ID  NUMBER(4,0) NOT NULL,
  CLAVE             VARCHAR2(7) NOT NULL,
  FECHA_APROBACION  DATE        NOT NULL,
  FECHA_TERMINO     DATE        NULL,--SOLO SI YA REMPLAZO EL PLAN DE ESUTDIOS
  CONSTRAINT PK_PLAN_ESTUDIOS PRIMARY KEY (PLAN_ESTUDIOS_ID),
  CONSTRAINT UK_PLAN_ESTUDIOS_CLAVE UNIQUE (CLAVE)

)
;

CREATE TABLE ASIGNATURA( --CATALOGO DE ASIGNATURAS
  ASIGNATURA_ID     NUMBER(4,0)   NOT NULL,
  CLAVE             NUMBER(4,0)   NOT NULL,
  NOMBRE            VARCHAR2(50)  NOT NULL,
  SEMESTRE_CURSAR   NUMBER(2)     NOT NULL,
  CREDITOS          NUMBER(2,0)   NOT NULL,
  PLAN_ESTUDIOS_ID  NUMBER(4,0)   NOT NULL,
  --------RESERVADO A MATERIAS QUE SEAN DE UNA CARRERA EN PARTICULAR--------
  ASIGNATURA_ANTECEDENTE  NUMBER(4,0) NULL,
  SEMESTRE_IMPARTICION  NUMBER(2) NULL,
  --------RESERVADO A MATERIAS QUE SEAN DE UNA CARRERA EN PARTICULAR--------
  CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ASIGNATURA_ID),
  CONSTRAINT FK_ASIGNATURA_ANTECEDENTE FOREIGN KEY (ASIGNATURA_ANTECEDENTE)
  REFERENCES ASIGNATURA(ASIGNATURA_ID),
  CONSTRAINT UK_ASIGNATURA_NOMBRE UNIQUE (NOMBRE),
  CONSTRAINT UK_ASIGNATURA_CLAVE UNIQUE (CLAVE)
)
;

CREATE TABLE DIA_SEMANA( --CATALOGO DIAS DE LA SEMANA
  DIA_SEMANA_ID NUMBER(6)     NOT NULL,
  DESCRIPCION   VARCHAR2(10)  NOT NULL,
  CONSTRAINT PK_DIA_SEMANA PRIMARY KEY (DIA_SEMANA_ID),
  CONSTRAINT CHK_DIA_SEMANA_ID
  CHECK (DIA_SEMANA_ID BETWEEN 1 AND 6) --LUNES A SÁBADO
)
;

CREATE TABLE HORARIO( --CATALOGO DE HORARIOS (DEPENDE DE DIA_SEMANA)
  HORARIO_ID      NUMBER(5,0) NOT NULL,
  DIA_IMPARTICION NUMBER(1)   NOT NULL,
  NUMERO_SALON    VARCHAR2(4) NOT NULL,
  NUMERO_CLASE    NUMBER(5)   NOT NULL,
  HORA_INICIO     DATE        NOT NULL,
  HORA_FIN        DATE        NOT NULL,
  CONSTRAINT PK_HORARIO PRIMARY KEY (HORARIO_ID),
  CONSTRAINT FK_HORARIO_DIA_IMPARTICION FOREIGN KEY (NUMERO_CLASE)
  REFERENCES DIA_SEMANA(DIA_SEMANA_ID),
  CONSTRAINT CHK_NUMERO_CLASE
  CHECK (NUMERO_CLASE BETWEEN 1 AND 5)
)
;

CREATE TABLE SEMESTRE( --CATALOGO DE SEMESTRE
  SEMESTRE_ID NUMBER(3) NOT NULL,
  ANIO        NUMBER(4) NOT NULL,
  PERIODO     NUMBER(1) NOT NULL,
  CONSTRAINT PK_SEMESTRE PRIMARY KEY (SEMESTRE_ID)
)
;

CREATE TABLE GRADO_ESTUDIOS(  --CATALOGO DE GRADOS DE ESUTUDIOS
  --RESERVADO A PROFESORES: LI,MA,DR
  GRADO_ESTUDIOS_ID NUMBER(1,0)   NOT NULL,
  CLAVE             VARCHAR2(2)   NOT NULL,
  DESCRIPCION       VARCHAR2(12)  NOT NULL,
  CONSTRAINT PK_GRADO_ESTUDIOS PRIMARY KEY (GRADO_ESTUDIOS_ID),
  CONSTRAINT UK_GRADO_ESTUDIOS_CLAVE UNIQUE (CLAVE)
)
;

CREATE TABLE PUESTO(  --CATLOGO DE PUESO
  --RESERVADO A LOS PROFESORES ADMINISTRATIVOS
  PUESTO_ID       NUMBER(3,0)   NOT NULL,
  NOMBRE_PUESTO   VARCHAR2(50)  NOT NULL,
  DESCRIPCION     VARCHAR2(12)  NOT NULL,
  --MODIFICACION DEL ESQUEMA ORGINAL PARA COLUMNA VIRUTAL--
  PAGO_HORA       NUMBER(5,2)   NOT NULL,
  HORAS_CUBRIR    NUMBER(2,0)   NOT NULL,
  --MODIFICACION DEL ESQUEMA ORGINAL PARA COLUMNA VIRUTAL--
  SARLIO_MENSUAL  NUMBER        GENERATED ALWAYS AS (PAGO_HORA * HORAS_CUBRIR),
  CONSTRAINT PK_PUESTO PRIMARY KEY (PUESTO_ID),
  CONSTRAINT UK_PUESTO_NOMBRE_PUESTO UNIQUE (NOMBRE_PUESTO)
)
;

CREATE TABLE STATUS_TESIS(  --CATALOGO DE ESTATUS DE TESIS
  -- REGISTRADA,VALIDADA, CONCLUIDA CANCELADA,CON_CEDULA
  STATUS_TESIS_ID NUMBER(1,0)   NOT NULL,
  CLAVE           VARCHAR2(15)  NOT NULL,
  DESCRIPCION     VARCHAR2(50)  NOT NULL,
  CONSTRAINT PK_STATUS_TESIS PRIMARY KEY (STATUS_TESIS_ID)
)
;

CREATE TABLE PROFESOR( --PROFESORES
  PROFESOR_ID               NUMBER(6,0)   NOT NULL,
  NOMBRE                    VARCHAR2(50)  NOT NULL,
  AP_PATERNO                VARCHAR2(50)  NOT NULL,
  AP_MATERNO                VARCHAR2(50)  NULL,
  RFC                       VARCHAR2(13)  NOT NULL,
  CEDULA_PROFESIONAL        NUMBER(7,0)   NOT NULL,
  GRADO_ESTUDIOS_ID         NUMBER(1,0)   NOT NULL,
  --SELECTOR DE TIPO DE PROFESOR--
  ES_PROFESOR_ASIGNATURA    CHAR(1)       NULL,
  ES_PROFESOR_CARRERA       CHAR(1)       NULL,
  ES_PROFESOR_ADMINISTRADOR CHAR(1)       NULL,
  --SELECTOR DE TIPO DE PROFESOR--
  CONSTRAINT PK_PROFESOR PRIMARY KEY (PROFESOR_ID),
  CONSTRAINT FK_PROFESOR_GRADO_ESTUDIOS FOREIGN KEY (GRADO_ESTUDIOS_ID)
  REFERENCES GRADO_ESTUDIOS(GRADO_ESTUDIOS_ID),
  CONSTRAINT UK_PROFESOR_RFC UNIQUE (RFC),
  CONSTRAINT UK_PROFESOR_CEDULA_PROFESIONAL UNIQUE (CEDULA_PROFESIONAL)
)
;

CREATE TABLE CURSO( --CURSOS IMPARTIDOS EN UN SEMESTRE
  CURSO_ID      NUMBER(10,0)  NOT NULL,
  ASIGNATURA_ID NUMBER(4,0)   NOT NULL,
  SEMESTRE_ID   NUMBER(3)     NOT NULL,
  PROFESOR_ID   NUMBER(6,0)   DEFAULT 0,--EN CASO DE NO ASIGNAR PROFESOR, SE ASIGNA 0
  NUM_GRUPO     NUMBER(4)     NOT NULL,
  HORARIO_ID    NUMBER(5,0)   NOT NULL,
  CONSTRAINT PK_CURSO PRIMARY KEY (CURSO_ID),
  CONSTRAINT FK_CURSO_ASIGNATURA_ID FOREIGN KEY (ASIGNATURA_ID)
  REFERENCES ASIGNATURA(ASIGNATURA_ID),
  CONSTRAINT FK_CURSO_SEMESTRE_ID FOREIGN KEY (SEMESTRE_ID)
  REFERENCES SEMESTRE(SEMESTRE_ID),
  CONSTRAINT FK_CURSO_PROFESOR_ID FOREIGN KEY (PROFESOR_ID)
  REFERENCES PROFESOR(PROFESOR_ID),
  CONSTRAINT FK_CURSO_HORARIO_ID FOREIGN KEY (HORARIO_ID)
  REFERENCES HORARIO(HORARIO_ID)
)
;

CREATE TABLE PROFESOR_ASIGNATURA(--PROFESOR DE ASIGNATURA
  PROFESOR_ID               NUMBER(6,0)   NOT NULL,
  NUM_CONTRATO              NUMBER(10,0)  NOT NULL,
  FECHA_INICIO_CONTRATO     DATE          NOT NULL,
  FECHA_FIN_CONTRATO        DATE          NOT NULL,
  NUM_VECES_SINODAL         NUMBER(3,0)   NOT NULL,
  --CONSTRAINT PK_PROFESOR_ASIGNATURA PRIMARY KEY PROFESOR_ID,
  CONSTRAINT FK_PROFESOR_ASIGNATURA_PROFESOR_ID FOREIGN KEY (PROFESOR_ID)
  REFERENCES PROFESOR(PROFESOR_ID),
  CONSTRAINT UK_PROFESOR_CARRERA_ASIANGATURA UNIQUE(PROFESOR_ID)
)
;

CREATE TABLE PROFESOR_CARRERA( --PROFESOR DE CARRERA
  --SUS GRADOS ESTAN ALMACENADOS EN ESPECIALIDAD
  PROFESOR_ID   NUMBER(6,0) NOT NULL,
  --CONSTRAINT PK_PROFESOR_CARRERA PRIMARY KEY PROFESOR_ID,
  CONSTRAINT FK_PROFESOR_CARRERA_PROFESOR_ID FOREIGN KEY (PROFESOR_ID)
  REFERENCES PROFESOR(PROFESOR_ID),
  CONSTRAINT UK_PROFESOR_CARRERA_PROFESOR UNIQUE(PROFESOR_ID)
)
;

CREATE TABLE PROFESOR_ADMINISTRADOR( --PROFESOR ADMINISTRADOR
  PROFESOR_ID   NUMBER(6,0) NOT NULL,
  PUESTO_ID     NUMBER(3,0) NOT NULL,
  --CONSTRAINT PK_PROFESOR_CARRERA PRIMARY KEY PROFESOR_ID,
  CONSTRAINT FK_PROFESOR_ADMINISTRAODR_ID FOREIGN KEY (PROFESOR_ID)
  REFERENCES PROFESOR(PROFESOR_ID),
  CONSTRAINT PK_PROFESOR_ADMINISTRADOR_PUESTO FOREIGN KEY (PUESTO_ID)
  REFERENCES PUESTO(PUESTO_ID)
)
;

CREATE TABLE ESPECIALIDAD( --ESPECIALIDAD
  ESPECIALIDAD_ID     NUMBER(3,0)   NOT NULL,
  PROFESOR_CARRERA_ID NUMBER(6,0)   NOT NULL,
  GRADO_ESTUDIOS_ID   NUMBER(1,0)   NOT NULL, --HACEMOS USO DE GRADO DE ESTUDIOS
  DESCRIPCION         VARCHAR2(150) NOT NULL,
  CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY (ESPECIALIDAD_ID),
  CONSTRAINT FK_ESPECIALIDAD_GRADO_ESTUDIOS FOREIGN KEY (GRADO_ESTUDIOS_ID)
  REFERENCES GRADO_ESTUDIOS(GRADO_ESTUDIOS_ID),
  CONSTRAINT FK_ESPECIALIDAD_PROFESOR_CARRERA_ID FOREIGN KEY (PROFESOR_CARRERA_ID)
  REFERENCES PROFESOR_CARRERA(PROFESOR_ID)
)
;

CREATE TABLE TESIS(
  TESIS_ID          NUMBER(4,0)   NOT NULL,
  NOMBRE            VARCHAR2(150) NOT NULL,
  FECHA_REGISTRO    DATE          NOT NULL,
  OBJETIVO          VARCHAR2(150) NOT NULL,
  PDF               BLOB          NULL,--LO RESOLVERÁ EL SCRIPT S-17
  STATUS_TESIS_ID   NUMBER(1,0)   NOT NULL,
  DIRECTOR_TESIS_ID NUMBER(6,0)   NULL,--SE ASIGNA POSTERIOR A SER ACEPTADA LA TESIS
  CONSTRAINT PK_TESIS PRIMARY KEY (TESIS_ID),
  CONSTRAINT FK_TESIS_STATUS_TESIS FOREIGN KEY (STATUS_TESIS_ID)
  REFERENCES STATUS_TESIS(STATUS_TESIS_ID),
  CONSTRAINT FK_TESIS_DIRECTOR_TESIS FOREIGN KEY (DIRECTOR_TESIS_ID)
  REFERENCES PROFESOR_CARRERA(PROFESOR_ID),
  CONSTRAINT UK_TESIS_NOMBRE UNIQUE (NOMBRE)
)
;

CREATE TABLE TESIS_HISTORICO(--HISTORIA DEL TRÁMITE DE TESIS
  TESIS_HISTORICO_ID  NUMBER(8,0) NOT NULL,
  STATUS_TESIS_ID     NUMBER(1,0) NOT NULL,
  TESIS_ID            NUMBER(4,0) NOT NULL,
  FECHA_MODIFICAICON  DATE        NOT NULL,
  CONSTRAINT PK_TESIS_HISTORICO PRIMARY KEY (TESIS_HISTORICO_ID),
  CONSTRAINT FK_STATUS_TESIS FOREIGN KEY (STATUS_TESIS_ID)
  REFERENCES STATUS_TESIS(STATUS_TESIS_ID),
  CONSTRAINT FK_TESIS FOREIGN KEY (TESIS_ID)
  REFERENCES TESIS(TESIS_ID)
)
;

CREATE TABLE ESTUDIANTE( --ESTUDIANTES
  ESTUDIANTE_ID       NUMBER(6,0)   NOT NULL,
  NOMBRE              VARCHAR2(50)  NOT NULL,
  AP_PATERNO          VARCHAR2(50)  NOT NULL,
  AP_MATERNO          VARCHAR2(50)  NULL,--EL ALUMNO PUEDE NO TENER ESTE APELLIDO
  FECHA_NACIMIENTO    DATE          NOT NULL,
  NUMERO_CUENTA       NUMBER(10)    NOT NULL,
  --SE ASIGNAN CUANDO EL ESTUDIANTE SE ENCUENTRA EN PROCESO DE TITULACIÓN--
  CEDULA_PROFESIONAL  NUMBER(7,0)   NULL,
  TESIS_ID            NUMBER(4,0)   NULL,
  --SE ASIGNAN CUANDO EL ESTUDIANTE SE ENCUENTRA EN PROCESO DE TITULACIÓN--
  CARRERA_ID          NUMBER(2,0)   NOT NULL,
  PLAN_ESTUDIOS_ID    NUMBER(4,0)   NOT NULL,
  CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (ESTUDIANTE_ID),
  CONSTRAINT FK_CARRERA_ID FOREIGN KEY (CARRERA_ID)
  REFERENCES CARRERA(CARRERA_ID),
  CONSTRAINT FK_PLAN_ESTUDIOS_ID FOREIGN KEY (PLAN_ESTUDIOS_ID)
  REFERENCES PLAN_ESTUDIOS(PLAN_ESTUDIOS_ID),
  CONSTRAINT FK_TESIS_ID FOREIGN KEY (TESIS_ID)
  REFERENCES TESIS(TESIS_ID),
  CONSTRAINT UK_ESTUDIANTE_NUMERO_CUENTA UNIQUE (NUMERO_CUENTA),
  CONSTRAINT UK_ESTUDIANTE_CEDULA_PROFESIONAL UNIQUE (CEDULA_PROFESIONAL)
)
;

CREATE TABLE ESTUDIANTE_INSCRITO(--ESTUDIANTE INSCRITOS EN UN CURSO, SIN LIMITE DE CUPO
  ESTUDIANTE_INSCRITO_ID  NUMBER(10, 0) NOT NULL,
  CURSO_ID                NUMBER(10, 0) NOT NULL,
  ESTUDIANTE_ID           NUMBER(6, 0)  NOT NULL,
  CALIFICACION            NUMBER(2, 0)  NULL, --SE ACTUALIZA AL FINALIZAR EL SEMESTRE
  NUM_INSCRIPCION         NUMBER(4,0)   NOT NULL,
  CONSTRAINT PK_ESTUDIANTE_INSCRITO PRIMARY KEY (ESTUDIANTE_INSCRITO_ID),
  CONSTRAINT FK_CURSO FOREIGN KEY (CURSO_ID)
  REFERENCES CURSO(CURSO_ID),
  CONSTRAINT FK_ESTUDIANTE FOREIGN KEY (ESTUDIANTE_ID)
  REFERENCES ESTUDIANTE(ESTUDIANTE_ID)
)
;

CREATE TABLE PLAN_ESTUDIOS_CARRERA( --RESOLUCION DEL M:M DE :
  --PLAN DE ESTUDIOS Y CARRERA
  PLAN_ESTUDIOS_CARRERA_ID  NUMBER(4,0) NOT NULL,
  CARRERA_ID                NUMBER(2,0) NOT NULL,
  PLAN_ESTUDIOS_ID          NUMBER(4,0) NOT NULL,
  CONSTRAINT PK_PLAN_ESTUDIOS_CARRERA_ID 
  PRIMARY KEY (PLAN_ESTUDIOS_CARRERA_ID),
  CONSTRAINT FK_PEC_CARRERA_ID FOREIGN KEY (CARRERA_ID)
  REFERENCES CARRERA(CARRERA_ID),
  CONSTRAINT FK_PEC_PLAN_ESTUDIOS_ID FOREIGN KEY (PLAN_ESTUDIOS_ID)
  REFERENCES PLAN_ESTUDIOS(PLAN_ESTUDIOS_ID)
)
;

CREATE TABLE CARRERA_ASIGNATURA(  --RESOLUCION DEL M:M DE :
  -- CARRERA Y ASIGNATURA
  CARRERA_ASIGNATURA_ID   NUMBER(4,0) NOT NULL,
  CARRERA_ID              NUMBER(2,0) NOT NULL,
  ASIGNATURA_ID           NUMBER(4,0) NOT NULL,
  CONSTRAINT PK_CARRERA_ASIGNATURA 
  PRIMARY KEY (CARRERA_ASIGNATURA_ID),
  CONSTRAINT FK_CA_CARRERA_ID FOREIGN KEY (CARRERA_ID)
  REFERENCES CARRERA(CARRERA_ID),
  CONSTRAINT FK_CA_ASIGNATURA_ID FOREIGN KEY (ASIGNATURA_ID)
  REFERENCES ASIGNATURA(ASIGNATURA_ID)  
)
;

CREATE TABLE CURSO_HORARIO( --RESOLUCION DEL M:M DE :
  --CURSO Y HORARIO
  CURSO_HORARIO_ID  NUMBER(4,0)   NOT NULL,
  CURSO_ID          NUMBER(10,0)  NOT NULL,
  HORARIO_ID        NUMBER(5,0)   NOT NULL,
  CONSTRAINT PK_CURSO_HORARIO 
  PRIMARY KEY (CURSO_HORARIO_ID),
  CONSTRAINT FK_CH_CURSO_ID FOREIGN KEY (CURSO_ID)
  REFERENCES CURSO(CURSO_ID),
  CONSTRAINT FK_CH_HORARIO_ID FOREIGN KEY (HORARIO_ID)
  REFERENCES HORARIO(HORARIO_ID)
)
;


CREATE TABLE CURSO_SEMESTRE(  --RESOLUCION DEL M:M DE :
  --CURSO Y SEMESTRE
  CURSO_SEMESTRE_ID NUMBER(4,0)   NOT NULL,
  CURSO_ID          NUMBER(10,0)  NOT NULL,
  SEMESTRE_ID       NUMBER(3,0)   NOT NULL,
  CONSTRAINT PK_CURSO_SEMESTRE_ID PRIMARY KEY (CURSO_SEMESTRE_ID),
  CONSTRAINT FK_CS_CURSO_ID FOREIGN KEY (CURSO_ID)
  REFERENCES CURSO(CURSO_ID),
  CONSTRAINT FK_CS_SEMESTRE_ID FOREIGN KEY (SEMESTRE_ID)
  REFERENCES SEMESTRE(SEMESTRE_ID)
)
;

CREATE TABLE TESIS_SINODAL( --RESOLUCION DEL M:M DE :
  --TESIS Y SINODAL (PROFESOR_ASIGNATURA)
  TESIS_SINODAL_ID  NUMBER(4,0) NOT NULL,
  TESIS_ID          NUMBER(4,0) NOT NULL,
  SINODAL_ID        NUMBER(6,0) NOT NULL,
  CONSTRAINT PK_TESIS_SINODAL_ID PRIMARY KEY (TESIS_SINODAL_ID),
  CONSTRAINT FK_TS_TESIS_ID FOREIGN KEY (TESIS_ID)
  REFERENCES TESIS(TESIS_ID),
  CONSTRAINT FK_TS_PROFESOR FOREIGN KEY (SINODAL_ID)
  REFERENCES PROFESOR(PROFESOR_ID)
)
;
