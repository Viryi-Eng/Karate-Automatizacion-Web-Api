Automatización de APIs con Karate Framework
Descripción
Proyecto de automatización de pruebas API desarrollado con Karate Framework para validar los servicios de la API pública Simple Books.

La solución contempla:

Generación dinámica de token.
Pruebas CRUD de órdenes.
Pruebas negativas.
Documentación de defecto encontrado en el endpoint de actualización.
Tecnologías Utilizadas
Java 17
Karate Framework 1.4.1
JUnit 5
Gradle
IntelliJ IDEA
Estructura del Proyecto
src
│
├── test
│   ├── java
│   │   └── runners
│   │       └── RunnerTest.java
│   │
│   └── resources
│       ├── karate-config.js
│       │
│       └── features
│           ├── token.feature
│           ├── booking.feature
│           ├── Negative.feature
│           └── bugs.feature
│
└── build.gradle
Configuración del Proyecto
build.gradle
plugins {
id 'java'
}

repositories {
mavenCentral()
}

dependencies {
testImplementation 'com.intuit.karate:karate-junit5:1.4.1'
testImplementation 'org.junit.jupiter:junit-jupiter:5.10.2'
testRuntimeOnly 'org.junit.platform:junit-platform-launcher:1.10.2'
}

test {
useJUnitPlatform()
}
Configuración Global
karate-config.js
function fn() {

    var config = {
        baseUrl: 'https://simple-books-api.glitch.me'
    };

    var result = karate.callSingle('classpath:features/token.feature');

    config.accessToken = result.accessToken;

    return config;
}
Casos Automatizados
1. Generación de Token
   Archivo:

token.feature
Validaciones:

Registro dinámico de cliente.
Obtención de Access Token.
Almacenamiento automático para el resto de escenarios.
2. CRUD de Órdenes
   Archivo:

booking.feature
Operaciones ejecutadas:

Crear Orden
POST /orders
Validaciones:

Código HTTP 201.
Confirmación de creación.
Obtención del orderId.
Consultar Orden
GET /orders/{orderId}
Validaciones:

Código HTTP 200.
Consulta correcta de la orden creada.
Eliminar Orden
DELETE /orders/{orderId}
Validaciones:

Código HTTP 204.
Eliminación exitosa.
3. Pruebas Negativas
   Archivo:

Negative.feature
Escenarios cubiertos:

Consulta de orden inexistente.
Solicitudes sin token.
Validaciones de respuesta de error.
Manejo de códigos HTTP negativos.
4. Hallazgo Encontrado
   Archivo:

updateBug.feature
Durante la ejecución de las pruebas se detectó un comportamiento inesperado en el servicio de actualización de órdenes.

Endpoint
PATCH /orders/{orderId}
Resultado Esperado
204 No Content
Resultado Obtenido
308 Permanent Redirect
Impacto
La actualización del campo:

{
"customerName": "Virgilio QA Modificado"
}
no se realiza correctamente.

Al consultar nuevamente la orden se obtiene:

{
"customerName": "Virgilio QA"
}
lo que evidencia que el recurso no fue actualizado.

Runner
RunnerTest.java
package runners;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {

    @Karate.Test
    Karate test() {
        return Karate.run(
                "classpath:features"
        ).relativeTo(getClass());
    }
}
Ejecución de Pruebas
Desde IntelliJ
Ejecutar:

RunnerTest.java
Desde Terminal
Linux/Mac:

gradle clean test
Windows:

.\gradlew clean test
Reportes
Karate genera automáticamente reportes HTML.

Ubicación:

build/karate-reports/
Archivo principal:

karate-summary.html
El reporte permite visualizar:

Casos ejecutados.
Evidencias.
Request.
Response.
Logs.
Resultado de ejecución.
Cobertura Implementada
✅ Generación de Token

✅ Creación de Órdenes

✅ Consulta de Órdenes

✅ Eliminación de Órdenes

✅ Pruebas Negativas

✅ Reportes HTML

✅ Identificación y documentación de defectos

Autor
Virgilio Abdiel Arena Carpintero

Analista de Pruebas

Proyecto realizado como práctica de automatización de pruebas API utilizando Karate Framework, Gradle y JUnit 5.