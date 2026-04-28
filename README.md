# actividad_netflix

Imagina que formas parte de un equipo de ingeniería en Netflix, dedicada a ofrecer una plataforma de streaming con millones de usuarios. Durante una actualización reciente de uno de sus servicios internos, el equipo detectó problemas graves:

La aplicación funciona correctamente en algunas computadoras, pero falla en otras.
Los servidores tienen configuraciones distintas entre sí.
Los despliegues se realizan manualmente y toman demasiado tiempo.
No existe una forma clara de validar automáticamente si una nueva versión está lista para desplegarse.
El monitoreo actual no permite detectar rápidamente errores de desempeño.
El director técnico solicita una propuesta rápida pero sólida para estandarizar el entorno, automatizar tareas clave y preparar un flujo de despliegue más confiable.

Tu tarea será actuar como consultor DevOps y generar una solución inicial que ayude a reducir estos problemas.

## Docker

Imagen de python

Aislamiento: La aplicación lleva sus propias librerías; no depende del sistema operativo del servidor.

Portabilidad: Se garantiza que lo que corre en el laptop del desarrollador correrá exactamente igual en producción.

## punto 6

Para garantizar que todos los servidores sean idénticos, utilizamos AWS CloudFormation. Estos son los recursos clave definidos en infraestructura.yaml:

S3 Bucket: Función: Almacena de forma centralizada los archivos de la aplicación, imágenes y logs de errores.

Solución: Evita que cada servidor tenga archivos distintos; todos consultan la misma "fuente de verdad".

Instancia EC2: Función: Es el servidor donde se ejecuta nuestra aplicación dentro de Docker.

Solución: Al estar definida por código, eliminamos el problema de "configuraciones distintas". Cada servidor nuevo será una copia exacta del anterior, con la misma memoria, CPU y sistema operativo.

¿Por qué usar esto? En lugar de configurar servidores a mano (lo cual toma mucho tiempo y causa errores), ejecutamos la plantilla y en pocos minutos tenemos todo el entorno listo y estandarizado.

##  Diseño del Pipeline CI/CD

Para eliminar los despliegues manuales y garantizar que el código sea confiable antes de llegar a producción, se ha diseñado el siguiente flujo automatizado:

| Etapa | Herramienta | Acción Realizada | Beneficio |
| :--- | :--- | :--- | :--- |
| **Source** | GitHub | El desarrollador sube código a la rama `main`. | Centralización del código. |
| **Build** | Docker | Se construye la imagen de la aplicación (`Dockerfile`). | Entornos idénticos siempre. |
| **Test** | PyTest / Bash | Se ejecutan pruebas de validación automática. | Evita subir errores a producción. |
| **Deploy** | AWS CodeDeploy | Se despliega el contenedor en las instancias EC2. | Despliegue rápido y sin manos. |
| **Monitor** | CloudWatch | Se vigilan métricas de CPU y errores en tiempo real. | Respuesta rápida ante fallos. |

---

###  Detalle de las Etapas

1. **Source:** Cualquier cambio en el repositorio dispara el proceso automáticamente.
2. **Build:** La aplicación se empaqueta con todas sus librerías. Esto soluciona el problema de "en mi computadora sí funciona".
3. **Test:** Antes de instalar nada, el sistema verifica que la nueva versión esté lista. Si los tests fallan, el despliegue se detiene.
4. **Deploy:** Se actualizan los servidores de Netflix de forma estandarizada usando la infraestructura definida en código.
5. **Monitoreo:** Si algo sale mal después del despliegue, el equipo recibe una notificación inmediata para actuar.