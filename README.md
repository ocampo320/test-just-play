# Documentación de la Aplicación

## Desarrollador
- **Nombre**: Deibi Ocampo
- **GitHub**: [GitHub de Deibi Ocampo](https://github.com/ocampo320)
- **LinkedIn**: [Perfil de LinkedIn de Deibi Ocampo](https://www.linkedin.com/in/deibi-ocampo-8348b9113)
- **Título Profesional**: Ingeniero de sistemas

## Resumen
Esta aplicación Flutter fue desarrollada con la versión del SDK '>=2.19.2 <3.0.0' y consta de las siguientes funcionalidades:

1. **Pantalla de Inicio de Sesión**: Para acceder a la aplicación, los usuarios pueden utilizar las siguientes credenciales:
   - Usuario: "maria"
     Contraseña: "password"
   - Usuario: "carlos"
     Contraseña: "123456"

2. **Onboarding**: Una vez iniciada la sesión, se muestra una breve introducción que da la bienvenida al usuario.

3. **Pantalla de Inicio (Home)**: Inicialmente, la pantalla de inicio estará vacía. Para acceder a las opciones de programación de canchas, debes presionar el botón "Más".

4. **Programación de Canchas**: En esta pantalla, la aplicación consume un servicio para listar las ciudades disponibles. Los usuarios pueden completar un formulario para programar una cancha.

5. **Pantalla de Clima**: Después de completar el formulario, se mostrará una tarjeta en la pantalla de inicio con la información de la cancha programada. En esta tarjeta, la aplicación consume un servicio para proporcionar información sobre el estado del clima en la ubicación de la cancha.

6. **Borrar la Agenda**: La aplicación permite a los usuarios borrar una reserva de cancha previamente programada.

## Requisitos del Sistema
- Flutter SDK '>=2.19.2 <3.0.0'

## Instrucciones de Uso
1. Inicia la aplicación y accede a la pantalla de inicio de sesión.
2. Utiliza las credenciales proporcionadas ("maria" o "carlos") para iniciar sesión.
3. Después de iniciar sesión, se mostrará un onboarding de bienvenida.
4. En la pantalla de inicio, presiona el botón "Más" para acceder a la programación de canchas.
5. En la pantalla de programación de canchas, selecciona una ciudad y completa el formulario para programar una cancha.
6. Una vez programada, la información de la cancha se mostrará en la pantalla de inicio en forma de una tarjeta con datos del clima.
7. Si es necesario, puedes borrar una reserva de cancha previamente programada.

## Notas Adicionales
- Asegúrate de tener una conexión a Internet activa para que la aplicación pueda consumir los servicios de ciudades y clima.
- La aplicación es compatible con dispositivos móviles que ejecutan Flutter SDK '>=2.19.2 <3.0.0'.

¡Disfruta de la aplicación!
