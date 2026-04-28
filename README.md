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